const cds = require('@sap/cds')

module.exports = class CrmService extends cds.ApplicationService { async init() {

  const { Leads, LeadRatings, LeadSoures, LeadStatus, Accounts, Contact, Deals, DealStages, Activities, ActivityType, ActicityStatus, ActivityPritorities, Campaigns, CampaignsTypes, CampaignsStatus, CampaignsMembers, CampaignsMembersStatus, Products, Vendors, Quotes, QuoteStatus, SalesOrders, SalesOrderStatus, Invoices, InvoiceStatus } = cds.entities('CrmService')
  this.before('CREATE',Leads, req=>{ //default lead status and ratings
    if(req.data.leadStatus_code){
      req.data.leadStatus_code ='NEW';
    }
      req.data.rating_code ??= 'WARM';
  })
  this.before('UPDATEE',Leads,async req=>{ //only leads owners can update
    const lead=await Select.one.from(Leads).where({ID:req.data.ID});
    if(lead && lead.owner_ID !=req.user.id){
      req.reject(403,'Only Leads owner can update the lead');
    }
  })
  this.before('CREATE',Leads,req=>{  //checking email validations
    const {email} =req.data;
    if(!email || !email.includes('@')){
      req.reject(400,'Invalid Email Address'); 
    }
  });

  return super.init()
}}
