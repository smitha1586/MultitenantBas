
using {managed, sap.common.CodeList as CodeList} from '@sap/cds/common';

context appSmithaMulti.db {


entity Sales {
  key ID          : Integer;
      region      : String(100);
      country     : String(100);
      org         : String(4);
      amount      : Integer;
      comments    : String(100);
      criticality : Integer;
};

@odata.draft.enabled:true
entity Employees : managed {
    key ID        : UUID @(Core.Computed: true);
        EmployeeId : Integer ;
        firstName : String;
        lastName  : String;
        age       : Integer;
        dob       : Date;
        test      : String;
}


}

@cds.persistence.exists
@cds.persistence.calcview
entity CV_SALES {
  key REGION  : String(100);
      AMOUNT  : Integer;
}

@cds.persistence.exists
@cds.persistence.calcview
entity CV_SESSION_INFO {
  key ITEM     : String(5000);
      VALUE    : String(5000);
}
