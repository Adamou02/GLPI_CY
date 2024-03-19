-- Drop Materialized Views
DROP MATERIALIZED VIEW GLPI_PROD.GLOBAL_Ticket;
DROP MATERIALIZED VIEW GLPI_PROD.Ticket_Counts_By_Category;
DROP MATERIALIZED VIEW GLPI_PROD.Tickets_By_Location;
DROP MATERIALIZED VIEW GLPI_PROD.Ticket_Resolution_Time;
DROP MATERIALIZED VIEW GLPI_PROD.Recent_Ticket_Activity;

-- Drop Views
DROP VIEW GLPI_PROD.Open_Tickets_By_Category;
DROP VIEW GLPI_PROD.Closed_Tickets;
DROP VIEW GLPI_PROD.Tickets_By_Priority;
DROP VIEW GLPI_PROD.Tickets_Assigned_To_Users;
DROP VIEW GLPI_PROD.Ticket_Comments;
DROP VIEW GLPI_PROD.Tickets_By_Status;
DROP VIEW GLPI_PROD.Tickets_By_Type;

-- Drop Materialized Views
DROP MATERIALIZED VIEW GLPI_TEST.GLOBAL_Ticket;
DROP MATERIALIZED VIEW GLPI_TEST.Ticket_Counts_By_Category;
DROP MATERIALIZED VIEW GLPI_TEST.Tickets_By_Location;
DROP MATERIALIZED VIEW GLPI_TEST.Ticket_Resolution_Time;
DROP MATERIALIZED VIEW GLPI_TEST.Recent_Ticket_Activity;

-- Drop Views
DROP VIEW GLPI_TEST.Open_Tickets_By_Category;
DROP VIEW GLPI_TEST.Closed_Tickets;
DROP VIEW GLPI_TEST.Tickets_By_Priority;
DROP VIEW GLPI_TEST.Tickets_Assigned_To_Users;
DROP VIEW GLPI_TEST.Ticket_Comments;
DROP VIEW GLPI_TEST.Tickets_By_Status;
DROP VIEW GLPI_TEST.Tickets_By_Type;

COMMIT;
exit;