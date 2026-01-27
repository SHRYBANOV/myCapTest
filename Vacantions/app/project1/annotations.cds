using MyService as service from '../../srv/service';
annotate service.Employee with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
            Criticality : status.criticality,
        },
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
            $Type : 'UI.DataFieldForAction',
            Action : 'MyService.changeStatus',
            Label : 'changeStatus',
        },
    ],
    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : firstname,
        },
        {
            $Type : 'UI.DataField',
            Value : lastname,
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
            Value : status_code,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MyService.changeStatus',
            Label : 'changeStatus',
        },
    ],
);

annotate service.Employee with {
    status @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Status',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Status',
        },
        Common.Text : status.displayText,
    )
};

annotate service.Status with {
    code @(
        Common.Text : displayText,
        Common.Text.@UI.TextArrangement : #TextLast,
)};

