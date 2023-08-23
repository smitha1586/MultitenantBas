using tmsService from './catalog-service';

annotate tmsService.Routes with {
  ID        @UI   : {Hidden: true};
  routeCode @title: 'Route Code';
  routeName @title: 'Route Name';
  routeStop @title: 'Route Stop';
  routeType @title: 'Route Type';

}

annotate tmsService.Routes with @(UI: {
  HeaderInfo        : {
    TypeName      : 'Route',
    TypeNamePlural: 'Routes',
    // Title         : {
    //   $Type: 'UI.DataField',
    //   Value: routeCode
    // },
    // Description   : {
    //   $Type: 'UI.DataField',
    //   Value: routeName
    // }
  },
  SelectionFields   : [
    routeCode,
    routeName
  ],
  LineItem          : [
    {Value: routeCode, },
    {Value: routeName, },
    {Value: routeType}
  ],

  FieldGroup #Routes: {Data: [
    {
      $Type: 'UI.DataField',
      Value: routeCode
    },
    {
      $Type: 'UI.DataField',
      Value: routeName
    },
    {
      $Type: 'UI.DataField',
      Value: routeType
    }
  ]},

  Facets            : [
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'GeneralInfo',
      Label : 'General Information',
      Target: '@UI.FieldGroup#Routes'
    },
    {
      $Type : 'UI.ReferenceFacet',
      Label : 'Route Stops',
      Target: 'routeStop/@UI.LineItem'
    }
  ],


}, );

annotate tmsService.RouteStops with {
  routeID  @title: 'Route ID';
  sequence @title: 'Sequence'
};


annotate tmsService.RouteStops with @(UI: {

LineItem: [
  // {Value: routeID, },
  {Value: sequence, }
],

}, );

//Stops
annotate tmsService.Stops with {
    id        @UI.Hidden: true;
    stopCode  @title    : 'Stop Code';
    stopName  @title    : 'Stop Name';
    stopType  @title    : 'Stop Type';
    latitude  @title    : 'Latitude';
    longitude @title    : 'Longitude';
}

annotate tmsService.Stops with {      
        stopType @(Common : {
        ValueListWithFixedValues: true,
        ValueList       : {
            Label          : '{i18n>stopType}',
            CollectionPath : 'StopTypes',
            Parameters     : [
                {
                    $Type               : 'Common.ValueListParameterInOut',
                    ValueListProperty   : 'code',
                    LocalDataProperty   :  stopCode
                }                
            ]
        }
    });
} ;


annotate tmsService.Stops with @(UI: {
    HeaderInfo                 : {
        TypeName      : 'Stop',
        TypeNamePlural: 'Stops'
    },
    SelectionFields            : [
        stopCode,
        stopName,
        stopType_code
    ],
    LineItem                   : [
        {
            $Type: 'UI.DataField',
            Value: stopCode,
        },
        {
            $Type: 'UI.DataField',
            Value: stopName,
        },
        {
            $Type: 'UI.DataField',
            Value: stopCode,
        }
    ],

    FieldGroup #GeneratedGroup2: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: stopCode,
            },
            {
                $Type: 'UI.DataField',
                Value: stopName,
            },
            {
                $Type: 'UI.DataField',
                Value: stopCode,
            },
            {
                $Type: 'UI.DataField',
                Value: latitude,
            },
            {
                $Type: 'UI.DataField',
                Value: longitude,
            }
        ]
    },
    Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneratedFacet1',
            Label : 'General Information',
            Target: '@UI.FieldGroup#GeneratedGroup2',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Facility',
            Label : 'Facility',
            Target: 'stopFacilities/@UI.LineItem',
        }
    ]
}
 );

 // --------------------------------------------

 annotate tmsService.StopFacilities with {
     id                  @UI.Hidden: true;
     facilityID          @title    : 'Facility ID';
     facilityType        @title    : 'Facility Type';
     facilityNotes       @title    : 'Facility Notes';
     functionalIndicator @title    : 'Indicator';
 }

annotate tmsService.StopFacilities with @(UI: {LineItem: [
    {Value: facilityID},
    {Value: facilityType},
    {Value: facilityNotes},
    {Value: functionalIndicator}
]});

annotate tmsService.Employees with {
	firstName      @title: 'First Name';
	lastName       @title: 'Last Name';
    age            @title : 'Age' ;
    dob            @title : 'Date of Birth';
}

annotate tmsService.Employees with @(
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

annotate tmsService.Crew with {
	ID      	@title: 'Crew ID';
    crewType    @title : 'Crew Type'
}

annotate tmsService.Crew with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Crew',
			TypeNamePlural: 'Crew',
			Title          : {
                $Type : 'UI.DataField',
                Value : ID
            },
		},
	},
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Crew ID',
            Value : ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'First Name',
            Value : employeeID.firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Last Name',
            Value : employeeID.lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Crew Type',
            Value : crewType,
        }
    ]
);
annotate tmsService.Crew with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Crew ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Employee ID',
                Value : employeeID_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Crew type',
                Value : crewType,
            }
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
    UI.SelectionFields : [crewType,employeeID.firstName,employeeID.lastName] ,
    
);

annotate tmsService.Crew with {
	employeeID @(
		Common: {
			ValueList: {
				Label: 'Employees',
				CollectionPath: 'Employees',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: employeeID_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'firstName'
					},
                    { $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'lastName'
					}
				]
			}
		}
	);
    // crewType @(
	// 	Common: {
	// 		ValueList: {
	// 			Label: 'Crew Type',
	// 			CollectionPath: 'CrewType',
	// 			Parameters: [
	// 				{ $Type: 'Common.ValueListParameterInOut',
	// 					LocalDataProperty: crewType_code,
	// 					ValueListProperty: 'code'
	// 				},
	// 				{ $Type: 'Common.ValueListParameterDisplayOnly',
	// 					ValueListProperty: 'name'
	// 				}
	// 			]
	// 		}
	// 	}
	// );

}
annotate tmsService.Vehicle with {
	vehicleNumber      @title: 'Vehicle Number';
	vehicleType       @title: 'Vehicle Type';
  capacity            @title : 'Capacity' ;
  manufacturingDate   @title : 'Manufacturing Date';
}
annotate tmsService.Vehicle with @(
	UI: {
		HeaderInfo: {
			TypeName: 'Vehicle',
			TypeNamePlural: 'Vehicles',
			Title          : {
                $Type : 'UI.DataField',
                Value : ID
            },
		},
		SelectionFields: [vehicleNumber],
		LineItem: [
			{Value: vehicleNumber},
			{Value: vehicleType},
            {Value: capacity},
            {Value: manufacturingDate}
		],
	},
	 UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Vehicle Number',
                Value : vehicleNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : 'vehicle Type',
                Value : vehicleType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'capacity',
                Value : capacity,
            },
			{
                $Type : 'UI.DataField',
                Label : 'manufacturingDate',
                Value : manufacturingDate,
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
);


annotate tmsService.Schedule with @(
	UI: {
		HeaderInfo: {
            	TypeName: 'Schedule',
			    TypeNamePlural: 'Schedule',
			    Title          : {
                                $Type : 'UI.DataField',
                                Value : ID
                                },
		},
		SelectionFields: [ID, routeID],
		LineItem: [
			// {Value: routeID,}
        {
            $Type : 'UI.DataField',
            Label : 'Schedule ID',
            Value : ID
        },
        {
            $Type : 'UI.DataField',
            Label : 'Route ID',
            Value :  routeID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Schedule Start Time',
            Value :  scheduleStartTime,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Schedule End Time',
            Value :  scheduleEndTime,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Actual Start Time',
            Value :  actStartTime,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Actual End Time',
            Value :  actEndTime,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Trip Date',
            Value :  tripDate 
        }
		],
	},
    	 UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [

            {
            $Type : 'UI.DataField',
            Label : 'Schedule ID',
            Value : ID
           },
                  
           {
                $Type : 'UI.DataField',
                Label : 'Route ID',
                Value : routeID,
            },

            // {
            //     $Type : 'UI.DataField',
            //     Label : 'Driver ID',
            //     Value : driverID,
            // },

            // {
            //     $Type : 'UI.DataField',
            //     Label : 'Conductor ID',
            //     Value :  conductorID ,
            // },

            // {
            //     $Type : 'UI.DataField',
            //     Label : 'Vehicle ID',
            //     Value : vehicleID  ,
            // },

            {
                $Type : 'UI.DataField',
                Label : 'Schedule Start Time',
                Value : scheduleStartTime,
            },

            {
                $Type : 'UI.DataField',
                Label : 'Schedule End Time',
                Value : scheduleEndTime,
            },

            {
                $Type : 'UI.DataField',
                Label : 'Actual Start Time',
                Value : actStartTime,
            },

			{
                $Type : 'UI.DataField',
                Label : 'Trip Date',
                Value : tripDate,
            },
        ],
    },
     UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Schedule Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ],
) ;
annotate tmsService.ticket with {
  ID        @UI   : {Hidden: true};
  trip_id @title: 'Trip ID';
  start_stop @title: 'Start Stop';
  end_stop @title: 'End Stop';
  distance @title: 'Distance';
  fare @title: 'Fare';
  ticket_type @title: 'Ticket Type';
  concesssion @title: 'Concesssion';
  passenger_id @title: 'Passenger ID';
  trip_date @title: 'Trip Date';
  start_time @title: 'Trip Start Time';
  end_time @title: 'Trip End Time';
 

}

annotate tmsService.ticket with @(UI: {
  HeaderInfo        : {
    TypeName      : 'Ticket',
    TypeNamePlural: 'Ticket',
    // Title         : {
    //   $Type: 'UI.DataField',
    //   Value: routeCode
    // },
    // Description   : {
    //   $Type: 'UI.DataField',
    //   Value: routeName
    // }
  },
  SelectionFields   : [
    trip_id
   
  ],
  LineItem          : [
    {Value: trip_id, },
    {Value: start_stop, },
    {Value: end_stop,},
    {Value: distance,},
    {Value: fare,},
    {Value: ticket_type,},
    {Value: concesssion,},
    {Value: passenger_id,},
    {Value: trip_date,},
    {Value: start_time,},
    {Value: end_time,}



  ],

  FieldGroup #Tickets: {Data: [

      {
      $Type: 'UI.DataField',
      Value: trip_id,
    },
    {
      $Type: 'UI.DataField',
      Value: start_stop,
    },
    {
      $Type: 'UI.DataField',
      Value: end_stop
    }  ,

    {
      $Type: 'UI.DataField',
      Value: distance
    }  ,

     {
      $Type: 'UI.DataField',
      Value: fare
    }  ,

     {
      $Type: 'UI.DataField',
      Value: ticket_type
    }  ,

      {
      $Type: 'UI.DataField',
      Value: concesssion
    }  ,

       {
      $Type: 'UI.DataField',
      Value: passenger_id
    }  ,

       {
      $Type: 'UI.DataField',
      Value: trip_date
    }       ,


    {
      $Type: 'UI.DataField',
      Value: start_time
    }     ,      
    {
      $Type: 'UI.DataField',
      Value: end_time
    } 

    

  ]},

  Facets            : [

        {
      $Type : 'UI.ReferenceFacet',
      ID    : 'GeneralInfo',
      Label : 'Ticket Details',
      Target: '@UI.FieldGroup#Tickets'
    },

  ],


}, );
