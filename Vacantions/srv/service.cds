using { db } from '../db/schema';
service MyService {
    @odata.draft.enabled
    entity Employee as projection on db.Employee;
    @odata.draft.enabled
    entity EmplManager as projection on db.EmplManager;
    @odata.draft.enabled
    entity Vacbalances as projection on db.Vacbalances;
    @odata.draft.enabled
    entity VacRequest as projection on db.VacRequest;

}
annotate MyService.Employee with @UI.HeaderInfo @( TypeName: 'Employee', TypeNamePlural: 'Employees' );
annotate MyService.Employee with { ID @UI.Hidden @Common.Text : { $value : employeeid, ![@UI.TextArrangement]: #TextOnly }};
annotate MyService.Employee with @UI.Identification: [ { $Type : 'UI.DataField', Value : employeeid } ];
annotate MyService.Employee with {
    firstname @title : 'First Name';
    lastname @title : 'Last Name';
    email @title : 'Email';
    phone @title : 'Phone';
    hiredate @title : 'Hire Date';
    zposition @title : 'Position';
    department @title : 'Department';
    isactive @title : 'Active Status';
}

annotate MyService.Employee with @UI.LineItem:[
    { $Type : 'UI.DataField', Value : firstname, }, 
    { $Type : 'UI.DataField', Value : lastname, }, 
    { $Type : 'UI.DataField', Value : email, },  
    { $Type : 'UI.DataField', Value : phone, }, 
    { $Type : 'UI.DataField', Value : hiredate, }, 
    { $Type : 'UI.DataField', Value : zposition,  }, 
    { $Type : 'UI.DataField', Value : department, }, 
    { $Type : 'UI.DataField', Value : isactive, }
    ];
annotate MyService.Employee with @UI.FieldGroup #Main : {
    $Type : 'UI.FieldGroupType', Data : [
    { $Type : 'UI.DataField', Value : firstname, }, 
    { $Type : 'UI.DataField', Value : lastname, }, 
    { $Type : 'UI.DataField', Value : email, },  
    { $Type : 'UI.DataField', Value : phone, }, 
    { $Type : 'UI.DataField', Value : hiredate, }, 
    { $Type : 'UI.DataField', Value : zposition,  }, 
    { $Type : 'UI.DataField', Value : department, }, 
    { $Type : 'UI.DataField', Value : isactive, }
    ]
}; 
//facets -----
annotate MyService.Employee with @UI.Facets  : [
    { $Type : 'UI.ReferenceFacet', ID : 'Main', Label : 'Основные данные', Target : '@UI.FieldGroup#Main'},
    { $Type : 'UI.ReferenceFacet', Target : 'emplmanager/@UI.LineItem', Label : 'EmplManager', ID : 'idEmplManager'},
    { $Type : 'UI.ReferenceFacet', Target : 'vacbalances/@UI.LineItem', Label : 'VacBalances', ID : 'idVacBalances'},
    //{ $Type : 'UI.ReferenceFacet', Target : 'vacrequest/@UI.LineItem', Label : 'VacRequest', ID : 'idVacRequest' }
];
annotate MyService.Employee with @UI.SelectionFields: [
  employeeid
];

annotate MyService.EmplManager with {
    validfrom @title : 'validfrom';
    validto @title : 'validto';
    isprimary @title : 'isprimary';
}
annotate MyService.EmplManager with @UI.LineItem: [
        { $Type: 'UI.DataField', Value: 'validfrom' },
        { $Type: 'UI.DataField', Value: 'validto' }, 
        { $Type: 'UI.DataField', Value: 'isprimary' }
    ];
annotate MyService.EmplManager with @UI.FieldGroup #Main: {
    $Type : 'UI.FieldGroupType', Data : [
        { $Type: 'UI.DataField', Value: 'validfrom' },
        { $Type: 'UI.DataField', Value: 'validto' }, 
        { $Type: 'UI.DataField', Value: 'isprimary' }
    ] };
//annotate MyService.EmplManager with @UI.Facets  : [
//    { $Type : 'UI.ReferenceFacet', ID : 'Empl', Label : 'Менеджмент', Target : '@UI.FieldGroup#Empl'}
//];

annotate MyService.Vacbalances with @UI.LineItem: [
        { $Type: 'UI.DataField', Value: 'vacationtype' },
        { $Type: 'UI.DataField', Value: 'zyear' },
        { $Type: 'UI.DataField', Value: 'entitleddays' },
        { $Type: 'UI.DataField', Value: 'useddays' },
        { $Type: 'UI.DataField', Value: 'remainingdays' }
    ];
annotate MyService.Vacbalances with @UI.FieldGroup #Main: {
    $Type : 'UI.FieldGroupType', Data : [
        { $Type: 'UI.DataField', Value: 'vacationtype' },
        { $Type: 'UI.DataField', Value: 'zyear' },
        { $Type: 'UI.DataField', Value: 'entitleddays' },
        { $Type: 'UI.DataField', Value: 'useddays' },
        { $Type: 'UI.DataField', Value: 'remainingdays' }
    ] };
//annotate MyService.Vacbalances with @UI.Facets  : [
//    { $Type : 'UI.ReferenceFacet', ID : 'Vacbal', Label : 'Баланс', Target : '@UI.FieldGroup#Vacbal'}
//];

annotate MyService.VacRequest with {
    vacationtype @title : 'vacationtype';
    startdate @title : 'startdate';
    enddate @title : 'enddate';
    status @title : 'status';
    reason @title : 'reason';
}
annotate MyService.VacRequest with @UI.LineItem: [
        { $Type: 'UI.DataField', Value: 'vacationtype' },
        { $Type: 'UI.DataField', Value: 'startdate' },
        { $Type: 'UI.DataField', Value: 'enddate' },
        { $Type: 'UI.DataField', Value: 'status' },
        { $Type: 'UI.DataField', Value: 'reason' }
    ];
annotate MyService.VacRequest with @UI.FieldGroup #Main: {
    $Type : 'UI.FieldGroupType', Data : [
        { $Type: 'UI.DataField', Value: 'vacationtype' },
        { $Type: 'UI.DataField', Value: 'startdate' },
        { $Type: 'UI.DataField', Value: 'enddate' },
        { $Type: 'UI.DataField', Value: 'status' },
        { $Type: 'UI.DataField', Value: 'reason' }
    ]};
//annotate MyService.VacRequest with @UI.Facets  : [
//    { $Type : 'UI.ReferenceFacet', ID : 'Vacreq', Label : 'Запрос', Target : '@UI.FieldGroup#Vacreq'}
//];