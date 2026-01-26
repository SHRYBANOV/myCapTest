using MyService as service from '../../srv/service';
annotate service.Employee with @(
    UI.SelectionFields : [
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : firstname,
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : lastname,
            Criticality : status.criticality,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : phone,
        },
        {
            $Type : 'UI.DataField',
            Value : hiredate,
        },
        {
            $Type : 'UI.DataField',
            Value : zposition,
        },
        {
            $Type : 'UI.DataField',
            Value : department,
        },
        {
            $Type : 'UI.DataField',
            Value : isactive,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
        },
    ],
);

