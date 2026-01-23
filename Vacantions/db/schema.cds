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
  emplmanager    : Association to many EmplManager on emplmanager.employee = $self;
  vacbalances    : Association to many Vacbalances on vacbalances.employee = $self;
  vacrequest     : Association to many VacRequest on vacrequest.employee = $self;
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
  managerid     : UUID not null;
  employee      : Association to Employee;
  validfrom     : ze_validfrom;
  validto       : ze_validto;
  isprimary     : ze_isprimary;
}
entity Vacbalances : cuid, managed {
  vbal          : UUID not null;
  employee      : Association to Employee;
  vacationtype  : Association to VacType;
  zyear         : String(4);
  entitleddays  : ze_entitleddays;
  useddays      : ze_useddays;
  remainingdays : ze_remainingdays = entitleddays - useddays;
}
entity VacRequest : cuid, managed {
  req          : UUID not null;
  employee     : Association to Employee;
  vacationtype : Association to VacType;
  startdate    : ze_startdate;
  enddate      : ze_enddate;
  status       : Association to Status;
  reason       : ze_reason;
}