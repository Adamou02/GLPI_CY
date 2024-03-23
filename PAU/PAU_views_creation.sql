ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;


CREATE MATERIALIZED VIEW GLPI_PAU.GLOBAL_Ticket
AS
SELECT
    L.city as location,
    T.ticket_id,
    T.title,
    C_BY_U.last_name || ' ' || C_BY_U.first_name AS created_by,
    C_BY_U.email AS created_by_user_email,
    ASS_U.assigned_to AS assigned_to,
    ASS_U.assigned_to_user_email AS assigned_to_user_email,
    OBS.observers AS observers,
    OBS.observers_user_email AS observers_user_email,
    REF_T."type" AS type,
    REF_P."priority" AS priority,
    T."description",
    T.creation_datetime,
    T.last_modification_datetime,
    T.resolution_datetime,
    T.resolution_note,
    T.closing_datetime,
    REF_S.status AS status,
    REF_C."category" AS category,
    H."name" || ', ' || H."model" || ', ' || H.brand || ', ' || TO_CHAR(H.purchase_date, 'DD-MON-YYYY') AS hardware,
    REF_G."group" AS assigned_group,
    LC1.comment_id AS "Last Comment id",
    LC1."content" AS "Last Comment",
    LC2.comment_id AS "Second Last Comment id",
    LC2."content" AS "Second Last Comment"
FROM GLPI_PAU.TICKETS T
JOIN GLPI_PAU.USERS C_BY_U ON T.fk_created_by = C_BY_U.user_id
JOIN GLPI_PAU.REF_priority REF_P ON T.fk_priority = REF_P.priority_id
JOIN GLPI_PAU.REF_TYPE REF_T ON T.fk_type = REF_T.type_id
JOIN GLPI_PAU.LOCATIONS L ON T.fk_location = L.location_id
JOIN GLPI_PAU.REF_category REF_C ON T.fk_category = REF_C.category_id
JOIN GLPI_PAU.REF_status REF_S ON T.fk_status = REF_S.status_id
LEFT JOIN GLPI_PAU.HARDWARES H ON T.fk_hardwares = H.hardware_id
LEFT JOIN GLPI_PAU.REF_group REF_G ON T.fk_assigned_group = REF_G."group_id"
LEFT JOIN (
    SELECT fk_ticket, comment_id, "content", 
           ROW_NUMBER() OVER(PARTITION BY fk_ticket ORDER BY creation_datetime DESC) AS rn
    FROM GLPI_PAU.COMMENTS
) LC1 ON GLPI_PAU.T.ticket_id = LC1.fk_ticket AND LC1.rn = 1
LEFT JOIN (
    SELECT fk_ticket, comment_id, "content", 
           ROW_NUMBER() OVER(PARTITION BY fk_ticket ORDER BY creation_datetime DESC) AS rn
    FROM GLPI_PAU.COMMENTS
) LC2 ON GLPI_PAU.T.ticket_id = LC2.fk_ticket AND LC2.rn = 2
LEFT JOIN (
    SELECT
        T.ticket_id,
        LISTAGG(U.last_name || '  ' || U.first_name || ' ; ') WITHIN GROUP (ORDER BY AU.fk_user) AS assigned_to,
        LISTAGG(U.email || ' ; ') WITHIN GROUP (ORDER BY AU.fk_user) AS assigned_to_user_email
    FROM GLPI_PAU.TICKETS T
    JOIN GLPI_PAU.ASSIGNED_TO AU
        ON T.ticket_id = AU.fk_ticket
    JOIN GLPI_PAU.USERS U
        ON AU.fk_user = U.user_id
    GROUP BY T.ticket_id
) ASS_U ON ASS_U.ticket_id = T.ticket_id
LEFT JOIN (
    SELECT
        T.ticket_id,
        LISTAGG(U.last_name || ' ' || U.first_name || ' ; ') WITHIN GROUP (ORDER BY O.fk_user) AS observers,
        LISTAGG(U.email || ' ; ') WITHIN GROUP (ORDER BY O.fk_user) AS observers_user_email
    FROM GLPI_PAU.TICKETS T
    JOIN GLPI_PAU.OBSERVERS O
        ON T.ticket_id = O.fk_ticket
    JOIN GLPI_PAU.USERS U
        ON O.fk_user = U.user_id
    GROUP BY T.ticket_id
) OBS ON OBS.ticket_id = T.ticket_id
;



-- Ticket Counts by Category
CREATE MATERIALIZED VIEW GLPI_PAU.Ticket_Counts_By_Category AS
SELECT REF_category."category", COUNT(*) AS ticket_count
FROM GLPI_PAU.TICKETS
JOIN GLPI_PAU.REF_category ON TICKETS.fk_category = REF_category.category_id
GROUP BY REF_category."category";

-- Tickets by Location
CREATE MATERIALIZED VIEW GLPI_PAU.Tickets_By_Location AS
SELECT LOCATIONS."location", COUNT(*) AS ticket_count
FROM GLPI_PAU.TICKETS
JOIN GLPI_PAU.LOCATIONS ON TICKETS.fk_location = LOCATIONS.location_id
GROUP BY LOCATIONS."location";


-- Ticket Resolution Time
CREATE MATERIALIZED VIEW GLPI_PAU.Ticket_Resolution_Time AS
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
        FROM GLPI_PAU.TICKETS
        WHERE resolution_datetime IS NOT NULL
    )
);

-- Recent Ticket Activity
CREATE MATERIALIZED VIEW GLPI_PAU.Recent_Ticket_Activity AS
SELECT ticket_id, title, last_modification_datetime
FROM (
    SELECT ticket_id, title, last_modification_datetime
    FROM GLPI_PAU.TICKETS
    ORDER BY last_modification_datetime DESC
)
WHERE ROWNUM <= 100;

-- Open Tickets by Category View
CREATE VIEW GLPI_PAU.Open_Tickets_By_Category AS
SELECT c."category", s.status, COUNT(*) AS open_ticket_count
FROM GLPI_PAU.TICKETS t
JOIN GLPI_PAU.REF_category c ON t.fk_category = c.category_id
JOIN GLPI_PAU.REF_status s ON t.fk_status = s.status_id
WHERE UPPER(s.status) = 'TO DO' OR UPPER(s.status) = 'IN PROGRESS'
GROUP BY c."category", s.status;


-- Closed Tickets View
CREATE VIEW GLPI_PAU.Closed_Tickets AS
SELECT t.*, s.status
FROM GLPI_PAU.TICKETS t
JOIN GLPI_PAU.REF_status s ON t.fk_status = s.status_id
WHERE s.status = 'DONE';


-- Tickets by Priority View
CREATE VIEW GLPI_PAU.Tickets_By_Priority AS
SELECT REF_priority."priority", COUNT(*) AS ticket_count
FROM GLPI_PAU.TICKETS
JOIN GLPI_PAU.REF_priority ON TICKETS.fk_priority = REF_priority.priority_id
GROUP BY REF_priority."priority";

-- Tickets by Status View
CREATE VIEW GLPI_PAU.Tickets_By_Status AS
SELECT REF_status.status, COUNT(*) AS ticket_count
FROM GLPI_PAU.TICKETS
JOIN GLPI_PAU.REF_status ON TICKETS.fk_status = REF_status.status_id
GROUP BY REF_status.status;


-- Tickets by Type View
CREATE VIEW GLPI_PAU.Tickets_By_Type AS
SELECT REF_type."type", COUNT(*) AS ticket_count
FROM GLPI_PAU.TICKETS
JOIN GLPI_PAU.REF_type ON TICKETS.fk_type = REF_type.type_id
GROUP BY REF_type."type";

COMMIT;
exit;
