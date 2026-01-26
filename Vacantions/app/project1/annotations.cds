using MyService as service from '../../srv/service';
annotate service.Employee with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : firstname,
            Label : 'First Name',
        },
        {
            $Type : 'UI.DataField',
            Value : lastname,
            Label : 'Last Name',
        },
        {
            $Type : 'UI.DataField',
            Value : email,
            Label : 'Email',
        },
        {
            $Type : 'UI.DataField',
            Value : phone,
            Label : 'Phone',
        },
        {
            $Type : 'UI.DataField',
            Value : hiredate,
            Label : 'Hire Date',
        },
        {
            $Type : 'UI.DataField',
            Value : zposition,
            Label : 'Position',
        },
        {
            $Type : 'UI.DataField',
            Value : department,
            Label : 'Department',
        },
        {
            $Type : 'UI.DataField',
            Value : isactive,
            Label : 'Active Status',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
    ]
);

annotate service.Employee with {
    status @Common.Text : status.displayText
};

