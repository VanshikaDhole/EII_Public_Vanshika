const cds = require('@sap/cds')

module.exports = class ProcessorService extends cds.ApplicationService { init() {
  
this.before('CREATE','Incidents',async(req)=>{
  this.changeinStatusBasedonUrgency(req.data);
})
this.before('UPDATE','Incidents',async(req)=>{
  this.onUpdate(req);
})
return super.init()
}
changeinStatusBasedonUrgency(data){
  let urgency = data.title?.match(/urgent/i);
  if(urgency){
    data.status_code='H';
  }else{
    data.status_code='M';
  }
}
onUpdate(data){
  if (data.urgency ==='1') {
    data.status_code='H';
  } else if (data.urgency ==='2') {
    data.status_code='M';
  } else if (data.urgency ==='3'){
    data.status_code='L';
  }
}
}
