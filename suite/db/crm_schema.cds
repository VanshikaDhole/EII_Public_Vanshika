using {cuid,managed,sap.common.CodeList } from '@sap/cds/common';
using{sap.capire.core as core} from '../srv/core-service';
namespace sap.capire.crm;

entity Leads : cuid,managed {
    firstName:String(20);
    lastName:String(20);
    companyName:String(50);
    company:Association to core.Companies;
    email:String(50);
    phone:String(10);
    industry:String(50);
    rating:Association to LeadRatings;
    leadSource:Association to LeadSoures;
    leadStatus:Association to LeadStatus;
    owner:Association to core.Users;
    description:LargeString;
}
entity LeadStatus : CodeList {
    key code:String(20) enum{
        NEW ='NEW';
        CONTACT='CONTACT';
        QUALIFIED='QUALIFIED';
        CONVERTED='CONVERTED';
        LOST='LOST'
    }    
}
entity LeadSoures : CodeList {
    key code:String(20) enum{
        WEBSITE='WEBSITE';
        REFERRAL='REFERRAL';
        CAMPAIGN='CAMPAIGN';
        PARTNER='PARTNER';
        COLD_CALL='COLD_CALL';
    }
}
entity LeadRatings : CodeList {
    key code:String(20) enum{
        HOT='HOT';
        WARM='WARM';
        COLD='COLD';
    }   
}
entity Accounts : cuid,managed {
    accountName:String(30);
    website:String(50);
    phone:String(10);
    industry:String(30);
    annualRevenue:Decimal(15,2);
    billingAddress:LargeString;
    shippingAddress:LargeString;
    owner:Association to core.Users;
}
entity Contact : cuid,managed {
    firstName:String(30);
    lastName:String(20);
    email:String(20);
    mobile:String(15);
    title:String(20);
    mailingAddress:LargeString;
    account:Association to Accounts;  
}
entity Deals : cuid,managed {
    dealName:String(20);
    account:Association to Accounts;
    contact:Association to Contact;
    amount:Decimal(15, 2);
    stage:Association to DealStages;
    probability:Integer;
    closingDate:Date;
    owner:Association to core.Users; 
}
entity DealStages : CodeList {
    key code:String(20) enum{
        PROSPECTING='PROSPECTING';
        QUALIFICATION='QUALIFICATION';
        PROPOSAL='PROPOSAL';
        NEGOTIATION='NEGOTIATION';
        WON='WON';
        LOST='LOST';
    }
}
entity Activities : cuid,managed {
    subject:String(100);
    activityType:Association to ActivityType;
    dueDate:Date;
    status:Association to ActicityStatus;
    priority:Association to ActivityPritorities;
    relatedLead:Association to Leads;
    relatedDeal:Association to Deals;
    owner:Association to core.Users;
}
entity ActivityType : CodeList {
    key code:String(20) enum{
        TASK='TASK';
        CALL='CALL';
        MEETING='MEETING';
    }
}
entity ActicityStatus : CodeList {
    key code:String(20) enum{
        OPEN='OPEN';
        COMPLETED='COMPLETED';
        CANCELLED='CANCELLED';
    }
}
entity ActivityPritorities : CodeList {
    key code:String(20) enum{
        HIGH='HIGH';
        MEDIUM='MEDIUM';
        LOW='LOW;'
    }
}
entity Campaigns : cuid,managed {
    campaignName:String(20);
    type:Association to CampaignsTypes;
    status:Association to CampaignsStatus;
    startDate:Date;
    endDate:Date;
    budget:Decimal(15, 2);
    expectedRevenue:Decimal(15, 2);
    owner:Association to core.Users;
}
entity CampaignsTypes : CodeList {
    key code:String(20) enum{
        EMAIL='EMAIL';
        WEBINAR='WEBINAR';
        EVENT='EVENT';
        SOCIAL_MEDIA='SOCIAL_MEDIA';
    }
}
entity CampaignsStatus : CodeList {
    key code:String(20) enum{
        PLANNED='PLANNED';
        ACTIVE='ACTIVE';
        COMPLETED='COMPLETED';
        CANCELLED='CANCELLED';
    }
}
entity CampaignsMembers : cuid,managed {
    campaigns:Association to Campaigns;
    lead:Association to Leads;
    contact:Association to Contact;
    memberStatus:Association to CampaignsMembersStatus;
}
entity CampaignsMembersStatus : CodeList {
    key code:String(20) enum{
        SENT='SENT';
        OPEN='OPEN';
        RESPONDED='RESPONDED'
    } 
}
entity Products : cuid,managed {
    productName:String(20);
    productCode:String(20);
    unitPrice:Decimal(15,2);
    description:LargeString;
    vendor:Association to Vendors;
    active:Boolean default true;
}
entity Vendors : cuid,managed {
    vendorName:String(30);
    email:String(40);
    phone:String(20);
    website:String(20);
    address:String(40);
}
entity Quotes : cuid,managed {
    subject:String(100);
    account:Association to Accounts;
    deal:Association to Deals;
    subTotal:Decimal(15,2);
    tax:Decimal(15,2);
    grandTotal:Decimal(15,2);
    status:Association to QuoteStatus;
}
entity QuoteStatus : CodeList {
    key code:String(20) enum{
        DRAFT='DRAFT';
        SENT='SENT';
        APPROVED='APPROVED';
        REJECTED='REJECTED';
    }
}
entity SalesOrders : cuid,managed {
    subject:String(100);
    account:Association to Accounts;
    deal:Association to Deals;
    totalAmount:Decimal(15,2);
    status:Association to SalesOrderStatus;
}
entity SalesOrderStatus : CodeList {
    key code:String(20) enum{
        OPEN='OPEN';
        PROCESSING='PROCESSING';
        COMPLETED='COMPLETED';
        CANCELLED='CANCELLED';
    }
}
entity Invoices : cuid,managed {
    subject:String(100);
    account:Association to Accounts;
    invoiceDate:Date;
    dueDate:Date;
    totalAmount:Decimal(15,2);
    status:Association to InvoiceStatus;
}
entity InvoiceStatus : CodeList {
    key code:String(20) enum{
        DRAFT='DRAFT';
        SENT='SENT';
        PAID='PAID';
        OVERDUE='OVERDUE';
    }
}