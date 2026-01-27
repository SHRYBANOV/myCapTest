const cds = require('@sap/cds');
const { CREATE, UPDATE } = require('@sap/cds/lib/ql/cds-ql');



module.exports = class MyService extends cds.ApplicationService{ init()
{
    const { Employee, EmplManager } = cds.entities('MyService')

    this.before (['CREATE','UPDATE'],Employee,async(req) => {
        console.log('Before CREATE UPDATE Employee', req.data);
    })
    this.after (['READ'],Employee,async(empl,req) => {
        console.log('after READ Employee', empl);
    })

    this.on (['changeStatus'], Employee, async(req) => {
        const emplId = req.params[0].ID;
        const newStatus = req.data.newStatus;
        await UPDATE(Employee)
        .set({status_code : newStatus})
        .where({ID : emplId})
    })

    return super.init()
}}