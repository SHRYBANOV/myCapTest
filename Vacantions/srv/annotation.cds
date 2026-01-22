using { db } from '../db/schema';
annotate db.Employee.emplmanager with {
@UI.lineItem: [validfrom, validto, isprimary] };
annotate db.Employee.vacbalances with 
@UI.lineItem: [vacationtype, zyear, entitleddays, useddays, remainingdays];
annotate db.Employee.vacrequest with 
@UI.lineItem: [vacationtype, startdate, enddate, status, reason];