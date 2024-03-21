ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;


CREATE MATERIALIZED VIEW GLPI_TEST.GLOBAL_Ticket
REFRESH COMPLETE
START WITH SYSDATE NEXT SYSDATE + INTERVAL '1' MINUTE
AS
SELECT TICKETS.ticket_id, 
       USERS.last_name || ' ' || USERS.first_name AS created_by,
       USERS.email AS created_by_user_email,
       ASSIGNED_USERS.last_name || ' ' || ASSIGNED_USERS.first_name AS assigned_to,
       ASSIGNED_USERS.email AS assigned_to_user_email,
       REF_TYPE."type" AS type,
       REF_priority."priority" AS Priority,
       TICKETS."description",
       LOCATIONS."location" as location,
       TICKETS.creation_datetime,
       TICKETS.last_modification_datetime,
       TICKETS.resolution_datetime,
       TICKETS.resolution_note,
       TICKETS.closing_datetime,
       REF_status.status AS STATUS,
       REF_category."category" AS CATEGORY,
       HARDWARES."name" || ', ' || HARDWARES."model" || ', ' || HARDWARES.brand || ', ' || TO_CHAR(HARDWARES.purchase_date, 'DD-MON-YYYY') AS hardwares,
       REF_GROUP."group" AS assigned_group,
       LAST_COMMENT_1."content" AS "Last Comment 1",
       LAST_COMMENT_2."content" AS "Last Comment 2"
FROM GLPI_TEST.TICKETS
JOIN GLPI_TEST.USERS ON TICKETS.fk_created_by = USERS.user_id
JOIN GLPI_TEST.REF_priority ON TICKETS.fk_priority = GLPI_TEST.REF_priority.priority_id
JOIN GLPI_TEST.REF_TYPE ON TICKETS.fk_type = GLPI_TEST.REF_TYPE.type_id      
JOIN GLPI_TEST.LOCATIONS ON TICKETS.fk_location = GLPI_TEST.LOCATIONS.location_id
JOIN GLPI_TEST.REF_category ON TICKETS.fk_category = GLPI_TEST.REF_category.category_id
JOIN GLPI_TEST.REF_status ON TICKETS.fk_status = GLPI_TEST.REF_status.status_id
LEFT JOIN (
    SELECT fk_ticket, "content",
           ROW_NUMBER() OVER(PARTITION BY fk_ticket ORDER BY creation_datetime DESC) AS rn
    FROM GLPI_TEST.COMMENTS
) LAST_COMMENT_1 ON GLPI_TEST.TICKETS.ticket_id = LAST_COMMENT_1.fk_ticket AND LAST_COMMENT_1.rn = 1
LEFT JOIN (
    SELECT fk_ticket, "content",
           ROW_NUMBER() OVER(PARTITION BY fk_ticket ORDER BY creation_datetime DESC) AS rn
    FROM GLPI_TEST.COMMENTS
) LAST_COMMENT_2 ON GLPI_TEST.TICKETS.ticket_id = LAST_COMMENT_2.fk_ticket AND LAST_COMMENT_2.rn = 2
LEFT JOIN GLPI_TEST.ASSIGNED_TO ON TICKETS.ticket_id = GLPI_TEST.ASSIGNED_TO.fk_ticket
LEFT JOIN GLPI_TEST.USERS ASSIGNED_USERS ON GLPI_TEST.ASSIGNED_TO.fk_user = ASSIGNED_USERS.user_id
LEFT JOIN GLPI_TEST.HARDWARES ON TICKETS.fk_hardwares = GLPI_TEST.HARDWARES.hardware_id
LEFT JOIN GLPI_TEST.REF_group ON TICKETS.fk_assigned_group = GLPI_TEST.REF_group."group_id";



-- Ticket Counts by Category
CREATE MATERIALIZED VIEW GLPI_TEST.Ticket_Counts_By_Category AS
SELECT REF_category."category", COUNT(*) AS ticket_count
FROM GLPI_TEST.TICKETS
JOIN GLPI_TEST.REF_category ON TICKETS.fk_category = REF_category.category_id
GROUP BY REF_category."category";

-- Tickets by Location
CREATE MATERIALIZED VIEW GLPI_TEST.Tickets_By_Location AS
SELECT LOCATIONS."location", COUNT(*) AS ticket_count
FROM GLPI_TEST.TICKETS
JOIN GLPI_TEST.LOCATIONS ON TICKETS.fk_location = LOCATIONS.location_id
GROUP BY LOCATIONS."location";


-- Ticket Resolution Time
CREATE MATERIALIZED VIEW GLPI_TEST.Ticket_Resolution_Time AS
SELECT 
    TRUNC(AVG(DAY_RESOLUTION)) AS avg_days,
    TRUNC(MOD(AVG(DAY_RESOLUTION) * 24, 24)) AS avg_hours,
    TRUNC(MOD(AVG(DAY_RESOLUTION) * 24 * 60, 60)) AS avg_minutes,
    TRUNC(MOD(AVG(DAY_RESOLUTION) * 24 * 60 * 60, 60)) AS avg_seconds
FROM (
    SELECT 
        AVG(EXTRACT(DAY FROM resolution_interval)) AS DAY_RESOLUTION
    FROM (
        SELECT 
            resolution_datetime - creation_datetime AS resolution_interval
        FROM GLPI_TEST.TICKETS
        WHERE resolution_datetime IS NOT NULL
    )
);

-- Recent Ticket Activity
CREATE MATERIALIZED VIEW GLPI_TEST.Recent_Ticket_Activity AS
SELECT ticket_id, title, last_modification_datetime
FROM (
    SELECT ticket_id, title, last_modification_datetime
    FROM GLPI_TEST.TICKETS
    ORDER BY last_modification_datetime DESC
)
WHERE ROWNUM <= 100;

-- Open Tickets by Category View
CREATE VIEW GLPI_TEST.Open_Tickets_By_Category AS
SELECT c."category", s.status, COUNT(*) AS open_ticket_count
FROM GLPI_TEST.TICKETS t
JOIN GLPI_TEST.REF_category c ON t.fk_category = c.category_id
JOIN GLPI_TEST.REF_status s ON t.fk_status = s.status_id
WHERE UPPER(s.status) = 'TO DO' OR UPPER(s.status) = 'IN PROGRESS'
GROUP BY c."category", s.status;


-- Closed Tickets View
CREATE VIEW GLPI_TEST.Closed_Tickets AS
SELECT t.*, s.status
FROM GLPI_TEST.TICKETS t
JOIN GLPI_TEST.REF_status s ON t.fk_status = s.status_id
WHERE s.status = 'DONE';


-- Tickets by Priority View
CREATE VIEW GLPI_TEST.Tickets_By_Priority AS
SELECT REF_priority."priority", COUNT(*) AS ticket_count
FROM GLPI_TEST.TICKETS
JOIN GLPI_TEST.REF_priority ON TICKETS.fk_priority = REF_priority.priority_id
GROUP BY REF_priority."priority";

-- Tickets by Status View
CREATE VIEW GLPI_TEST.Tickets_By_Status AS
SELECT REF_status.status, COUNT(*) AS ticket_count
FROM GLPI_TEST.TICKETS
JOIN GLPI_TEST.REF_status ON TICKETS.fk_status = REF_status.status_id
GROUP BY REF_status.status;


-- Tickets by Type View
CREATE VIEW GLPI_TEST.Tickets_By_Type AS
SELECT REF_type."type", COUNT(*) AS ticket_count
FROM GLPI_TEST.TICKETS
JOIN GLPI_TEST.REF_type ON TICKETS.fk_type = REF_type.type_id
GROUP BY REF_type."type";

COMMIT;
exit;