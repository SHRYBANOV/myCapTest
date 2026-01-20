using { db } from '../db/schema';
service MyService {
    entity Employee as projection on db.Employee;
    entity EmplManager as projection on db.EmplManager;
    entity vacbalances as projection on db.vacbalances;
    entity vacrequest as projection on db.vacrequest;

}