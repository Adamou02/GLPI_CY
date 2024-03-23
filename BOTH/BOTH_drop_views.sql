-- Drop Materialized Views
DROP MATERIALIZED VIEW GLPI_CERGY.GLOBAL_Ticket;
DROP MATERIALIZED VIEW GLPI_CERGY.Ticket_Counts_By_Category;
DROP MATERIALIZED VIEW GLPI_CERGY.Tickets_By_Location;
DROP MATERIALIZED VIEW GLPI_CERGY.Ticket_Resolution_Time;
DROP MATERIALIZED VIEW GLPI_CERGY.Recent_Ticket_Activity;

-- Drop Views
DROP VIEW GLPI_CERGY.Open_Tickets_By_Category;
DROP VIEW GLPI_CERGY.Closed_Tickets;
DROP VIEW GLPI_CERGY.Tickets_By_Priority;
DROP VIEW GLPI_CERGY.Tickets_By_Status;
DROP VIEW GLPI_CERGY.Tickets_By_Type;

-- Drop Materialized Views
DROP MATERIALIZED VIEW GLPI_PAU.GLOBAL_Ticket;
DROP MATERIALIZED VIEW GLPI_PAU.Ticket_Counts_By_Category;
DROP MATERIALIZED VIEW GLPI_PAU.Tickets_By_Location;
DROP MATERIALIZED VIEW GLPI_PAU.Ticket_Resolution_Time;
DROP MATERIALIZED VIEW GLPI_PAU.Recent_Ticket_Activity;

-- Drop Views
DROP VIEW GLPI_PAU.Open_Tickets_By_Category;
DROP VIEW GLPI_PAU.Closed_Tickets;
DROP VIEW GLPI_PAU.Tickets_By_Priority;
DROP VIEW GLPI_PAU.Tickets_By_Status;
DROP VIEW GLPI_PAU.Tickets_By_Type;

COMMIT;
exit;
