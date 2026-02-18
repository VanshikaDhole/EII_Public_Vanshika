const cds = require('@sap/cds')

module.exports = class FlightsService extends cds.ApplicationService { init() {

  const { Connections, Airlines, Airports, Flights, Supplements } = cds.entities('FlightsService')

  this.after ('READ', Flights, async ( ) => {
    console.log('I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
  this.after ('READ', Airports, async ( ) => {
    console.log('I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
   this.after ('READ', Airlines, async ( ) => {
    console.log('I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
    this.after ('READ', Connections, async ( ) => {
    console.log(' I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
     this.after ('READ', Supplements, async ( ) => {
    console.log('I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
  this.on ('READ',Flights, async()=>{
    console.log('I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
  this.on ('READ', Airports, async ( ) => {
    console.log('I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
   this.on ('READ', Airlines, async ( ) => {
    console.log('I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
    this.on ('READ', Connections, async ( ) => {
    console.log(' I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
     this.on ('READ', Supplements, async ( ) => {
    console.log('I am Vanshika,I am from Nagpur Maharashtra .I completed my BTech in Electroincs And Telecommunication from S.B.Jain Now currently working in BrainBox as an EII Consultant.Thats about me ThankYou' )
  })
  return super.init()
}}
