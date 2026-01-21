using { cuid, managed } from '@sap/cds/common';
namespace db;

type  ze_firstname : String(100);
type  ze_lastname : String(100);
type  ze_phone: String(15);
type  ze_email : String(100);
type  ze_position : String(50);
type  ze_department : String(50);
type  abap_boolean: Boolean;
type  ze_validfrom: Date;
type  ze_validto: Date;
type  ze_isprimary: abap_boolean;
type  ze_vacationtype: String(4);
type  ze_entitleddays: Decimal(5, 2);
type  ze_useddays: Decimal(5, 2);
type  ze_remainingdays: Decimal(5, 2);
type  ze_startdate: Date;
type  ze_enddate: Date;
type  ze_status: String(4);
type  ze_reason: String(255);



entity Employee : cuid, managed {
  key employeeid : UUID not null;
  emplmanager    : Association to EmplManager;
  vacbalances    : Association to Vacbalances;
  vacrequest     : Association to VacRequest;
  firstname      : ze_firstname;
  lastname       : ze_lastname;
  email          : ze_email;
  phone          : ze_phone;
  hiredate       : Date;
  zposition      : ze_position;
  department     : ze_department;
  isactive       : abap_boolean;
}
entity EmplManager: cuid, managed {
  managerid     : Association to many Employee on managerid.emplmanager = $self;
  validfrom     : ze_validfrom;
  validto       : ze_validto;
  isprimary     : ze_isprimary;
}
entity Vacbalances : cuid, managed {
  vbal          : Association to many Employee on vbal.vacbalances = $self;
  employeeid    : Association to Employee;
  vacationtype  : ze_vacationtype;
  zyear         : String(4);
  entitleddays  : ze_entitleddays;
  useddays      : ze_useddays;
  remainingdays : ze_remainingdays;
}
entity VacRequest : cuid, managed {
  req          : Association to many Employee on req.vacrequest = $self;
  employeeid   : Association to Employee;
  vacationtype : ze_vacationtype;
  startdate    : ze_startdate;
  enddate      : ze_enddate;
  status       : ze_status;
  reason       : ze_reason;
}