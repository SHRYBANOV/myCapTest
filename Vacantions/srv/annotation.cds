using { db.Employee as Employee, db.EmplManager as EmplManager, db.Vacbalances as Vacbalances, db.VacRequest as VacRequest } from '../db/schema';

annotate Employee with @odata.draft.enabled;
annotate EmplManager  with @odata.draft.enabled;
annotate Vacbalances with @odata.draft.enabled;
annotate VacRequest with @odata.draft.enabled;

annotate Employee with @(
   UI.LineItem : [
      {Value: department},
      {Value: email},
      {Value: phone},
      {Value: firstname},
      {Value: lastname},
      {Value: zposition},
      {Value: hiredate},
      {Value: isactive},
      {Value: emplmanager},
      {Value: vacrequest},
      {Value: vacbalances},
      {Value: vacbalances},
   ],
);