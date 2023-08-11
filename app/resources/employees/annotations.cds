using CatalogService as service from '../../../srv/catalog-service';

annotate service.Employees with {
	firstName      @title: 'First Name';
	lastName       @title: 'Last Name';
    age            @title : 'Age' ;
    dob            @title : 'Date of Birth';
}

annotate service.Employees with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Employee',
			TypeNamePlural: 'Employees',
			Title          : {
                $Type : 'UI.DataField',
                Value : ID
            },
		},
		SelectionFields: [firstName],
		LineItem: [
			{Value: firstName},
			{Value: lastName},
            {Value: age},
            {Value: dob}
		],
	},
	 UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'First Name',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Last Name',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Age',
                Value : age,
            },
			{
                $Type : 'UI.DataField',
                Label : 'Date of Birth',
                Value : dob,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ],
) ;
