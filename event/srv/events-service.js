const cds = require('@sap/cds')
 
module.exports = class EventsService extends cds.ApplicationService { init() {
 
  const { Organizers, Venues, VenueHalls, Events, EventSessions, Tickets, Supplements } = cds.entities();
//  this.on('createFullEvent', async (req) => {

    // const tx = cds.tx(req);

    // try {
    //   /** 1️ Organizer */
    //   const organizer = await tx.run(
    //     INSERT.into(Organizers).entries({
    //       name: 'ABC Events Pvt Ltd',
    //       email: 'contact@abcevents.com',
    //       phone: '+91-9876543210',
    //       website: 'https://www.abcevents.com',
    //       country: 'IN'
    //     })

    //   );
    //    await tx.commit();

    //   return { message: 'Full Event Data Created Successfully' };

    // } catch (error) {
    //   await tx.rollback();
    //   req.error(500, error.message);
    // }})
    
  this.on('READ',Organizers,async(req)=>{
    return await cds.run( SELECT.from(Organizers).columns('name','phone'))
    // const tx = cds.transaction(req);
    // await tx.run(
    //    return SELECT.from(Organizers)
    //   .columns('name','phone')
    // )
  })
  this.on('READ',VenueHalls,async(req)=>{
    return await cds.run(SELECT.from(VenueHalls).columns('hallName','hallType').where({hallType:'Indoor'}))
  })
  this.before('CREATE',Organizers,async(req)=>{
    return await cds.run(INSERT.into(Organizers).entries({  name: 'Live Nation',
  email: 'contact@livenation.com',
  phone: '9876543210',
  website: 'https://livenation.com',
  country: 'IN'}))
  })
  this.before('CREATE',Organizers,async(req)=>{
  const result= await INSERT.into('sap.capire.events.Organizers').entries({
  name: 'Live Nation',
  email: 'contact@livenation.com',
  phone: '9876543210',
  website: 'https://livenation.com',
  country: 'IN'
});
return result;
})
 
  return super.init()
}}