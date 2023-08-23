using {sap.cim.log.tms as tms} from '../db/data-model';

@path: 'service/tms'
service tmsService {
  @odata.draft.enabled
  entity Stops @(restrict: [
    {
      grant: ['READ'],
      to   : ['TMSViewer']
    },
    {
      grant: ['*'],
      to   : ['TMSManager']
    }
  ])                    as projection on tms.Stops;


  // @odata.draft.enabled
  entity StopFacilities @(restrict: [
    {
      grant: ['READ'],
      to   : ['TMSViewer']
    },
    {
      grant: ['*'],
      to   : ['TMSManager']
    }
  ])                      as projection on tms.StopFacilities;

  @odata.draft.enabled
  entity Routes   @(restrict: [
    {
      grant: ['READ'],
      to   : ['TMSViewer']
    },
    {
      grant: ['*'],
      to   : ['TMSManager']
    }
  ])                           as projection on tms.Routes;

  // annotate tmsService.Routes with @odata.draft.enabled;
  entity RouteStops     @(restrict: [
    {
      grant: ['READ'],
      to   : ['TMSViewer']
    },
    {
      grant: ['*'],
      to   : ['TMSManager']
    }
  ])                     as projection on tms.RouteStops;

  entity Employees       @(restrict: [
    {
      grant: ['READ'],
      to   : ['TMSViewer']
    },
    {
      grant: ['*'],
      to   : ['TMSManager']
    }
  ])                    as projection on tms.Employees;
  annotate Employees with @odata.draft.enabled;
  
  entity Crew           @(restrict: [
    {
      grant: ['READ'],
      to   : ['TMSViewer']
    },
    {
      grant: ['*'],
      to   : ['TMSManager']
    }
  ])                     as projection on tms.Crew;
  annotate Crew with @odata.draft.enabled;
  
  entity StopTypes    @(restrict: [
    {
      grant: ['READ'],
      to   : ['TMSViewer']
    },
    {
      grant: ['*'],
      to   : ['TMSManager']
    }
  ])                       as projection on tms.StopTypes;

// @odata.draft.enabled
//entity Vehicle  as projection on tms.Vehicle;


@odata.draft.enabled
entity ticket  as projection on tms.ticket;


/*  entity ticket   @(restrict: [
    {
      grant: ['READ'],
      to   : ['TMSViewer']
    },
    {
      grant: ['*'],
      to   : ['TMSManager']
    }
  ])  as projection on tms.ticket;  */


@odata.draft.enabled
entity Schedule  as projection on tms.Schedule;
// annotate Schedule with @odata.draft.enabled;


  // @odata.draft.enabled
  // entity Schedule@(restrict: [
  //   {
  //     grant: ['READ'],
  //     to   : ['TMSViewer']
  //   },
  //   {
  //     grant: ['*'],
  //     to   : ['TMSManager']
  //   }
  // ])                    as projection on tms.Schedule;
};