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

};
};