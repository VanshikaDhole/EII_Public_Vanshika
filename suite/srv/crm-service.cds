using { sap.capire.crm as my } from '../db/crm_schema';
service CrmService {
    entity Leads as projection on my.Leads;
    entity LeadStatus as projection on my.LeadStatus;
    entity LeadSoures as projection on my.LeadSoures;
    entity LeadRatings as projection on my.LeadRatings;
    entity Accounts as projection on my.Accounts;
    entity Contact as projection on my.Contact;
    entity Deals as projection on my.Deals;
    entity DealStages as projection on my.DealStages;
    entity Activities as projection on my.Activities;
    entity ActivityType as projection on my.ActivityType;
    entity ActicityStatus as projection on my.ActicityStatus;
    entity ActivityPritorities as projection on my.ActivityPritorities;
    entity Campaigns as projection on my.Campaigns;
    entity CampaignsTypes as projection on my.CampaignsTypes;
    entity CampaignsStatus as projection on my.CampaignsStatus;
    entity CampaignsMembers as projection on my.CampaignsMembers;
    entity CampaignsMembersStatus as projection on my.CampaignsMembersStatus;
    entity Products as projection on my.Products;
    entity Vendors as projection on my.Vendors;
    entity Quotes as projection on my.Quotes;
    entity QuoteStatus as projection on my.QuoteStatus;
    entity SalesOrders as projection on my.SalesOrders;
    entity SalesOrderStatus as projection on my.SalesOrderStatus;
    entity Invoices as projection on my.Invoices;
    entity InvoiceStatus as projection on my.InvoiceStatus;
}


