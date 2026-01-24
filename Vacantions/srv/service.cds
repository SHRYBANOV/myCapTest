using { db } from '../db/schema';
service MyService {
    @odata.draft.enabled
    entity Employee as projection on db.Employee;
   // @odata.draft.enabled
    entity EmplManager as projection on db.EmplManager;
   // @odata.draft.enabled
    entity Vacbalances as projection on db.Vacbalances;
   // @odata.draft.enabled
    entity VacRequest as projection on db.VacRequest;
    @readonly
    @CDS.odata.valuelist
    entity VacType as projection on db.VacType;
    @readonly
    @CDS.odata.valuelist
    entity Status as projection on db.Status;
}

annotate MyService.Employee with @UI: { headerInfo: { 
    typeName: 'Employee', 
    typeNamePlural: 'Юзеров',
    Title          : {
        $Type : 'UI.DataField',
        Value : ID,
    },
}};
annotate MyService.Employee with { ID @UI.Hidden };
annotate MyService.Employee with @UI.Identification: [ 
    { $Type : 'UI.DataField', Value : firstname, }, 
    { $Type : 'UI.DataField', Value : lastname, }, 
    { $Type : 'UI.DataField', Value : email, },  
    { $Type : 'UI.DataField', Value : phone, }, 
    { $Type : 'UI.DataField', Value : hiredate, }, 
    { $Type : 'UI.DataField', Value : zposition,  }, 
    { $Type : 'UI.DataField', Value : department, }, 
    { $Type : 'UI.DataField', Value : isactive, }
    ];
annotate MyService.Employee with {
    firstname @title : 'First Name';
    lastname @title : 'Last Name';
    email @title : 'Email';
    phone @title : 'Phone';
    hiredate @title : 'Hire Date';
    zposition @title : 'Position';
    department @title : 'Department';
    isactive @title : 'Active Status';
};

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
    { $Type : 'UI.ReferenceFacet', Target : 'emplmanager/@UI.LineItem', Label : 'Менеджмент', ID : 'idEmplManager'},
    { $Type : 'UI.ReferenceFacet', Target : 'vacbalances/@UI.LineItem', Label : 'VacBalances', ID : 'idVacBalances'},
    { $Type : 'UI.ReferenceFacet', Target : 'vacrequest/@UI.LineItem', Label : 'VacRequest', ID : 'idVacRequest' }
];
annotate MyService.Employee with @UI.SelectionFields: [
  employeeid
];

//annotate MyService.EmplManager with @UI.HeaderInfo @( TypeName: 'EmplManager', TypeNamePlural: 'EmplManagers' );
//annotate MyService.EmplManager with { ID @UI.Hidden @Common.Text : { $value : validfrom, ![@UI.TextArrangement]: #TextOnly }};
/*annotate MyService.EmplManager with {
    validfrom @title : 'validfrom';
    validto @title : 'validto';
    isprimary @title : 'isprimary';
}*/
annotate MyService.EmplManager with @UI.Identification: [ 
       { $Type: 'UI.DataField', Value: 'validfrom' },
        { $Type: 'UI.DataField', Value: 'validto' }, 
        { $Type: 'UI.DataField', Value: 'isprimary' }
];
annotate MyService.EmplManager with @UI.LineItem: [
        { $Type: 'UI.DataField', Value: 'validfrom', Label: 'Valid From'},
        { $Type: 'UI.DataField', Value: 'validto', Label: 'Valid To' }, 
        { $Type: 'UI.DataField', Value: 'isprimary', Label: 'Is Primary' }
    ];
annotate MyService.EmplManager with @UI.FieldGroup #Main: {
    $Type : 'UI.FieldGroupType', Data : [
        { $Type: 'UI.DataField', Value: 'validfrom' },
        { $Type: 'UI.DataField', Value: 'validto' }, 
        { $Type: 'UI.DataField', Value: 'isprimary' }
    ] };
annotate MyService.EmplManager with @UI.Facets  : [
    { $Type : 'UI.ReferenceFacet', ID : 'Empl', Label : 'Менеджмент', Target : '@UI.FieldGroup#Main'}
];


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
annotate MyService.Vacbalances with @UI.Facets  : [
    { $Type : 'UI.ReferenceFacet', ID : 'Vacbal', Label : 'Баланс', Target : '@UI.FieldGroup#Main'}
];

annotate MyService.VacRequest with @UI.LineItem: [
        { $Type: 'UI.DataField', Value: 'req' },
        { $Type: 'UI.DataField', Value: 'vacationtype' },
        { $Type: 'UI.DataField', Value: 'startdate' },
        { $Type: 'UI.DataField', Value: 'enddate' },
       // { $Type: 'UI.DataField', Value: 'status' },
        { $Type: 'UI.DataField', Value: 'reason' }
    ];
annotate MyService.VacRequest with @UI.FieldGroup #Main: {
    $Type : 'UI.FieldGroupType', Data : [
        { $Type: 'UI.DataField', Value: 'req' },
        { $Type: 'UI.DataField', Value: 'vacationtype' },
        { $Type: 'UI.DataField', Value: 'startdate' },
        { $Type: 'UI.DataField', Value: 'enddate' },
        //{ $Type: 'UI.DataField', Value: 'status' },
        { $Type: 'UI.DataField', Value: 'reason' }
    ]};
annotate MyService.VacRequest with @UI.Facets  : [
    { $Type : 'UI.ReferenceFacet', ID : 'Vacreq', Label : 'Запрос', Target : '@UI.FieldGroup#Main'}
];

