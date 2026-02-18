const cds = require('@sap/cds'); 
const { SELECT, expand } = require('@sap/cds/lib/ql/cds-ql');
module.exports = class CoreService extends cds.ApplicationService { init() {

  const { Companies, Departments, Designations, Levels, Users, Roles, Permissions, RolePermission, UserRoles, ApprovalFlows, Approvals, Status, Notifications, SystemSettings, Attachments, AuditLogs } = cds.entities('CoreService')
  
  this.before('CREATE',Users,req=>{  //checking email validations
    const {email} =req.data;
    if(!email || !email.includes('@')){
      req.reject(400,'Invalid Email Address'); 
    }
  });

  this.before('UPDATE',Users,async (req)=>{ //checking if someone trying to delete the admin
    if(req.data.active === false){
      const admins = await SELECT.from(sap.capire.core.UserRoles).where({role_code: 'ADMIN'});
      if(admins.length <= 1){
        req.reject(400,'Atleast one active admine is required')
      }
    }
  });

  this.before('DELETE',Roles,async(req)=>{ //perventing deleting roles assigned to users
    const roleID =req.data.ID;
    const assignedUser= await SELECT.from(sap.capire.core.UserRoles).where({role_ID:roleID});
    if(assignedUser.length > 0 ){
      req.reject(400,'Cannot delete the role assigned  to users')
    }
  });

  this.before('DELETE',Departments,async req =>{ //perventing deleting departments
    const deptID = req.data.ID;
    const users = await SELECT.from(sap.capire.core.Users).where({department_ID:deptID});
    if(users.length > 0 ){
      req.reject(400,'Department has users assigned')
    }
  });

  this.before('UPDATE',Approvals, req=>{ //only approver can update the status
    if(req.data.status_code){
      if(req.data.approver_ID !== req.user.ID ){
        req.reject(403,'only assigned approver can update the status');
      }
    }
  });
  
  this.after(['CREATE','UPDATE'],Approvals,async (data,req)=>{ //notification
    const tx =cds.tx(req);
    await tx.run(INSERT.into(Notifications).entries({
      users_ID:data.approver_ID,
      title: 'New Approval Request',
      message: `Approval request pending for record ${data.referenceID}`,
      read: false
    }));
  });
  
  this.before('CREATE',SystemSettings,async req=>{ // stop duplicatation systemsettings
     const {settingName,module}= req.data;
    const existingSettings=await SELECT.one.from(SystemSettings).where({settingName,module})
    if(existingSettings) {
      req.reject(400,'Setting already exist');
    }
    else{
      console.log("Settings Updated..")
    }
  });

  this.before('CREATE',Attachments,req=>{ //file size limitations
    if(req.data.filesize > 10*1024*1024){
      req.reject(400,'filesize exceeds the limit');
    }
  });

  this.after(['CREATE','UPDATE','DELETE'],'*',async(data,req)=>{
    if(!req.target || !data?.ID) return;
    const tx =cds.tx(req);
    console.log(req.target.name);
    await tx.run( INSERT.into(AuditLogs).entries({
          entityName: req.target.name,
          recordID: data.ID,
          action: req.event,
          changedBy_ID: req.user?.id || 'SYSTEM',
          oldValue: JSON.stringify(req._oldData || {}),
          newValue: JSON.stringify(data)
    }
    ));
  });
  this.on('READ',Users,async(req)=>{
    
    const result= await cds.tx(req).run(SELECT.from(Users).columns('userName','email','phone',
      {ref:['company'],expand:[{ref:['code']},{ref:['name']}]}))
      return result;
  })
  this.on('READ',RolePermission,async(req)=>{
    const result1= await cds.tx(req).run(SELECT.from(RolePermission).columns('role','permission'));
    return result1;
  })
  
  return super.init()

}}
