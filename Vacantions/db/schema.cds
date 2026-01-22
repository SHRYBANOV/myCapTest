using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';
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
type  ze_reason: String(255);

entity Status : CodeList {
key code: String enum {
    new = 'N';
    assigned = 'A'; 
    in_process = 'I'; 
    on_hold = 'H'; 
    resolved = 'R'; 
    closed = 'C'; 
}};
entity VacType : CodeList {
key code: String enum {
    new = 'N';
    assigned = 'A'; 
    in_process = 'I'; 
    on_hold = 'H'; 
    resolved = 'R'; 
    closed = 'C'; 
}};
entity Employee : cuid, managed {
  key employeeid     : UUID not null;
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
  key managerid     : UUID not null;
  employee       :Association to many Employee on employee.emplmanager = $self;
  validfrom     : ze_validfrom;
  validto       : ze_validto;
  isprimary     : ze_isprimary;
}
entity Vacbalances : cuid, managed {
  key vbal          : UUID not null;
  employee       :Association to many Employee on employee.vacbalances = $self;
  vacationtype  : Association to VacType default 'N';
  zyear         : String(4);
  entitleddays  : ze_entitleddays;
  useddays      : ze_useddays;
  remainingdays : ze_remainingdays = entitleddays - useddays;
}
entity VacRequest : cuid, managed {
  key req          : UUID not null;
  employee       :Association to many Employee on employee.vacrequest = $self;
  vacationtype : ze_vacationtype;
  startdate    : ze_startdate;
  enddate      : ze_enddate;
  status       : Association to Status default 'N';
  reason       : ze_reason;
}