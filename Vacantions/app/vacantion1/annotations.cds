using MyService as service from '../../srv/service';
annotate service.Employee with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Имя',
                Value : firstname,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Фамилия',
                Value : lastname,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Мыло',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Телефон',
                Value : phone,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Дата назначения',
                Value : hiredate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Позиция',
                Value : zposition,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Департамент',
                Value : department,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Активный.',
                Value : isactive,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'firstname',
            Value : firstname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastname',
            Value : lastname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Label : 'phone',
            Value : phone,
        },
        {
            $Type : 'UI.DataField',
            Label : 'hiredate',
            Value : hiredate,
        },
    ],
);

