using {
  managed,
  sap.common.CodeList as CodeList
} from '@sap/cds/common';

context appSmithaMulti.db {

  entity Stops : managed {
    key id             : UUID @(Core.Computed: true);
        stopCode       : String(10);
        stopName       : String(100);
        stopType       : Association to one StopTypes;
        latitude       : Decimal(15, 12);
        longitude      : Decimal(15, 12);
        stopFacilities : Composition of many StopFacilities
                           on stopFacilities.stop = $self;
  }

  entity StopFacilities : managed {
    key id                  : UUID @(Core.Computed: true);
        facilityID          : String(10);
        facilityType        : String(2);
        facilityNotes       : String(100);
        functionalIndicator : String(2);
        stop                : Association to Stops;
  }

  entity Routes : managed {
    key ID          : UUID @(Core.Computed: true);
        routeCode   : String(5);
        routeName   : String;
        routeType   : String(2);
        parentRoute : UUID;
        avgspeed    : Integer;
        //        startstop : Association to Stops;
        //        endstop : Association to Stops;
        //        routeStop : Association to many RouteStops on routeStop.routeID = $self;
        routeStop   : Composition of many RouteStops
                        on routeStop.routeID = $self;
  }

  entity RouteStops : managed {
    key ID       : UUID @(Core.Computed: true);
        //        stopid :  Association to Stops;
    key routeID  : Association to Routes;
        sequence : Integer
  }

  // CodeList
  entity StopTypes : CodeList {
    key code                    : String enum {
          Normal      = '01';
          Interchange = '02';
          HighDensity = '03';
          Terminal    = '04';
        } default '01'; //> will be used for foreign keys as well
        fieldControl            : Integer @odata.Type: 'Edm.Byte'; // 1: #ReadOnly, 7: #Mandatory
        createDeleteHidden      : Boolean;
        insertDeleteRestriction : Boolean; // = NOT createDeleteHidden
  }

  entity Sales {
    key ID          : Integer;
        region      : String(100);
        country     : String(100);
        org         : String(4);
        amount      : Integer;
        comments    : String(100);
        criticality : Integer;
  };

  @odata.draft.enabled: true
  @cds.odata.valuelist
  entity Employees : managed {
    key ID         : UUID @(Core.Computed: true);
        EmployeeId : Integer;
        firstName  : String;
        lastName   : String;
        age        : Integer;
        dob        : Date;
        test       : String;
  }

  type CrewTypeEnum : String enum {
    Driver        = '1';
    Conductor     = '2';
    TicketChecker = '3';
    Admin         = '4';
  }


  entity CrewTypes : CodeList {
    key code : String enum {
          Driver        = '1';
          Conductor     = '2';
          TicketChecker = '3';
          Admin         = '4';
        }
  }

  entity Crew : managed {
    key ID         : UUID @(Core.Computed: true);
        employeeID : Association to one Employees;
        crewType   : CrewTypeEnum;
  }

  entity Vehicle : managed {
    key ID                : UUID @(Core.Computed: true);
        vehicleNumber     : String;
        vehicleType       : String(20);
        capacity          : Integer;
        manufacturingDate : Date;
  }

  entity Schedule : managed {
    key ID                : UUID @(Core.Computed: true);
        routeID           : UUID;
        Routes            : Association to one Routes
                              on Routes.ID = routeID;
        driverID          : UUID;
        // Crew              : Association to one Crew on Crew.crewType.Driver = driverID;
        // conductorID       : Association to one Crew on conductorID = $self;
        // vehicleID         : Association to one Vehicle on vehicleID = $self;
        scheduleStartTime : Timestamp;
        scheduleEndTime   : Timestamp;
        actStartTime      : Timestamp;
        actEndTime        : Timestamp;
        tripDate          : Date;

  }

  entity ticket : managed {

    key ID           : UUID @(Core.Computed: true);
        trip_id      : Integer;
        start_stop   : String;
        end_stop     : String;
        distance     : Integer;
        fare         : Integer;
        ticket_type  : String;
        concesssion  : String;
        passenger_id : String;
        trip_date    : Date;
        start_time   : Time;
        end_time     : Time;


  }
}

@cds.persistence.exists
@cds.persistence.calcview
entity CV_SALES {
  key REGION : String(100);
      AMOUNT : Integer;
}

@cds.persistence.exists
@cds.persistence.calcview
entity CV_SESSION_INFO {
  key ITEM  : String(5000);
      VALUE : String(5000);
}
