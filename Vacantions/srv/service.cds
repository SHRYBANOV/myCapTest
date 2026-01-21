using { db } from '../db/schema';
service MyService {
    entity Employee as projection on db.Employee;
    entity EmplManager as projection on db.EmplManager;
    entity Vacbalances as projection on db.Vacbalances;
    entity VacRequest as projection on db.VacRequest;

}