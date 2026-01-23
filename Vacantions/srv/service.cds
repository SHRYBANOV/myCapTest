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
 

annotate MyService.Employee with @(
    UI : {
        LineItem : [
            { $Type : 'UI.DataField', Value : firstname, }, 
            { $Type : 'UI.DataField', Value : lastname, }, 
            { $Type : 'UI.DataField', Value : email, },  
            { $Type : 'UI.DataField', Value : phone, }, 
            { $Type : 'UI.DataField', Value : hiredate, }, 
            { $Type : 'UI.DataField', Value : zposition,  }, 
            { $Type : 'UI.DataField', Value : department, }, 
            { $Type : 'UI.DataField', Value : isactive, }

        ],
        
        FieldGroup #BasicData : {
            $Type : 'UI.FieldGroupType',
            Data : [
            { $Type : 'UI.DataField', Value : createdAt, },
            { $Type : 'UI.DataField', Value : createdBy, },
            { $Type : 'UI.DataField', Value : modifiedAt, },
            { $Type : 'UI.DataField', Value : modifiedBy, }
        ],
        },
        //facets
        Facets  : [
           { $Type : 'UI.ReferenceFacet', Target : '@UI.FieldGroup#BasicData', Label : 'Employee', ID : 'idBasicData'},
           { $Type : 'UI.ReferenceFacet', Target : 'emplmanager/@UI.LineItem', Label : 'EmplManager', ID : 'idEmplManager'},
           { $Type : 'UI.ReferenceFacet', Target : 'vacbalances/@UI.LineItem', Label : 'VacBalances', ID : 'idVacBalances'},
 //          { $Type : 'UI.ReferenceFacet', Target : 'vacrequest/@UI.LineItem', Label : 'VacRequest', ID : 'idVacRequest' },

        ],
    });

annotate MyService.EmplManager with @(
    UI: { LineItem : [
        { $Type: 'UI.DataField', Value: 'validfrom' },
        { $Type: 'UI.DataField', Value: 'validto' }, 
        { $Type: 'UI.DataField', Value: 'isprimary' }
    ],
    }
    );
annotate MyService.Vacbalances with @(
    UI: { LineItem: [
        { $Type: 'UI.DataField', Value: 'vacationtype' },
        { $Type: 'UI.DataField', Value: 'zyear' },
        { $Type: 'UI.DataField', Value: 'entitleddays' },
        { $Type: 'UI.DataField', Value: 'useddays' },
        { $Type: 'UI.DataField', Value: 'remainingdays' }
    ],
    }
);
annotate MyService.VacRequest with @(
    UI: { LineItem: [
        { $Type: 'UI.DataField', Value: 'vacationtype' },
        { $Type: 'UI.DataField', Value: 'startdate' },
        { $Type: 'UI.DataField', Value: 'enddate' },
        { $Type: 'UI.DataField', Value: 'status' },
        { $Type: 'UI.DataField', Value: 'reason' }
    ],
    }
    );