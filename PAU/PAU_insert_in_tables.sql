
-- Inserts pour REF_priority
INSERT INTO GLPI_PAU.REF_priority (priority_id, "priority") VALUES (1, 'Emergency');
INSERT INTO GLPI_PAU.REF_priority (priority_id, "priority") VALUES (2, 'Urgent');
INSERT INTO GLPI_PAU.REF_priority (priority_id, "priority") VALUES (3, 'Normal');
INSERT INTO GLPI_PAU.REF_priority (priority_id, "priority") VALUES (4, 'Low');
INSERT INTO GLPI_PAU.REF_priority (priority_id, "priority") VALUES (5, 'Infos');

-- Inserts pour REF_status
INSERT INTO GLPI_PAU.REF_status (status_id, status) VALUES (1, 'To do');
INSERT INTO GLPI_PAU.REF_status (status_id, status) VALUES (2, 'In Progress');
INSERT INTO GLPI_PAU.REF_status (status_id, status) VALUES (3, 'Done');

-- Inserts pour REF_category
INSERT INTO GLPI_PAU.REF_category (category_id, "category") VALUES (1, 'Software');
INSERT INTO GLPI_PAU.REF_category (category_id, "category") VALUES (2, 'Network');
INSERT INTO GLPI_PAU.REF_category (category_id, "category") VALUES (3, 'Security');

-- Inserts pour REF_type
INSERT INTO GLPI_PAU.REF_type (type_id, "type") VALUES (1, 'Incident');
INSERT INTO GLPI_PAU.REF_type (type_id, "type") VALUES (2, 'Change');
INSERT INTO GLPI_PAU.REF_type (type_id, "type") VALUES (3, 'Service Request');
INSERT INTO GLPI_PAU.REF_type (type_id, "type") VALUES (4, 'Bug Report');

-- Inserts pour REF_role
INSERT INTO GLPI_PAU.REF_role (role_id, "role") VALUES (1, 'Manager');
INSERT INTO GLPI_PAU.REF_role (role_id, "role") VALUES (2, 'Technician');
INSERT INTO GLPI_PAU.REF_role (role_id, "role") VALUES (3, 'Customer');
INSERT INTO GLPI_PAU.REF_role (role_id, "role") VALUES (4, 'Administrator');

-- Inserts pour REF_group
INSERT INTO GLPI_PAU.REF_group ("group_id", "group") VALUES (1, 'Development Team');
INSERT INTO GLPI_PAU.REF_group ("group_id", "group") VALUES (2, 'Quality Assurance Team');
INSERT INTO GLPI_PAU.REF_group ("group_id", "group") VALUES (3, 'Sales Department');

-- Inserts pour LOCATIONS
INSERT INTO GLPI_PAU.LOCATIONS (location_id, "location", "site", city) VALUES (1, '', '', 'Pau');

-- Inserts pour HARDWARES
INSERT INTO GLPI_PAU.HARDWARES (hardware_id, "name", "model", brand) VALUES (1, 'Laptop 2','HP 6','HP');
INSERT INTO GLPI_PAU.HARDWARES (hardware_id, "name", "model", brand) VALUES (2, 'Server 2','Cisco 2', 'Cisco');
INSERT INTO GLPI_PAU.HARDWARES (hardware_id, "name", "model", brand) VALUES (3, 'Switch 2','Cisco Switch 1', 'Cisco');
DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
       INSERT INTO GLPI_PAU.HARDWARES (hardware_id, "name", "model", brand) VALUES (0, DBMS_RANDOM.STRING('X', 6),DBMS_RANDOM.STRING('X', 10), DBMS_RANDOM.STRING('X', 5));
    END LOOP;
END;
/
    
-- Inserts pour USERS
EXECUTE GLPI_PAU.NEW_USER('Customer', 3,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'william_de_pau@gmail.com', 'Williams de Pau', 'Emily', '123 Industries', '');
EXECUTE GLPI_PAU.NEW_USER('Technician', 2,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'brown_de_pau@gmail.com', 'Brown de Pau', 'Michael', '456 Corporation', '');
EXECUTE GLPI_PAU.NEW_USER('Manager', 2,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'jones_de_pau@gmail.com', 'Jones de Pau', 'Jessica', '789 Enterprises', '');
EXECUTE GLPI_PAU.NEW_USER('Technician', 1,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'davis_de_pau@gmail.com', 'Davis de Pau', 'Matthew', 'ABC Corp', '');
EXECUTE GLPI_PAU.NEW_USER('Customer', 1,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'taylor_de_pau@gmail.com', 'Taylor de Pau', 'Daniel', 'XYZ Ltd', '');
EXECUTE GLPI_PAU.NEW_USER('Manager', 2,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'rodriguez_de_pau@gmail.com', 'Rodriguez de Pau', 'Olivia', 'XYZ Ltd', '');
EXECUTE GLPI_PAU.NEW_USER('Customer', 3,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'martinez_de_pau@gmail.com', 'Martinez de Pau', 'Liam', 'ABC Corp', '');
EXECUTE GLPI_PAU.NEW_USER('Technician', 1,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'lopez_de_pau@gmail.com', 'Lopez de Pau', 'Ethan', '456 Corporation', '');
EXECUTE GLPI_PAU.NEW_USER('Administrator', 2,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'gonzalez_de_pau@gmail.com', 'Gonzalez de Pau', 'Ava', '123 Industries', '');
EXECUTE GLPI_PAU.NEW_USER('Manager', 3,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'hernandez_de_pau@gmail.com', 'Hernandez de Pau', 'Mia', '789 Enterprises', '');
EXECUTE GLPI_PAU.NEW_USER('Administrator', 2,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'williams_de_pau_jr@gmail.com', 'Williams de Pau Jr', 'Liam Jr', 'XYZ Ltd Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Technician', 3,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'brown_de_pau_jr@gmail.com', 'Brown de Pau Jr', 'Ethan Jr', 'ABC Corp Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Manager', 3,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'jones_de_pau_jr@gmail.com', 'Jones de Pau Jr', 'Ava Jr', '456 Corporation Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Technician', 3,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'davido_de_pau_jr@gmail.com', 'Davis de Pau Jr', 'Mia Jr', '123 Industries Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Customer', 1,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'talyah_de_pau_jr@gmail.com', 'Taylor de Pau Jr', 'Olivia Jr', '789 Enterprises Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Administrator', 1,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'martin_de_pau_jr@gmail.com', 'Martinez de Pau Jr', 'Liam Jr', 'XYZ Ltd Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Technician', 3,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'lopez_de_pau_jr@gmail.com', 'Lopez de Pau Jr', 'Ethan Jr', 'ABC Corp Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Manager', 1,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'gonza_de_pau_jr@gmail.com', 'Gonzalez de Pau Jr', 'Ava Jr', '456 Corporation Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Technician', 3,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'hermado_de_pau_jr@gmail.com', 'Hernandez de Pau Jr', 'Mia Jr', '123 Industries Jr', '');
EXECUTE GLPI_PAU.NEW_USER('Customer', 1,DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?', 'rodriguo_de_pau_jr@gmail.com', 'Rodriguo de Pau Jr', 'Olivia Jr', '789 Enterprises Jr', '');
    SET SERVEROUTPUT ON;

DECLARE
    j NUMBER;
    random_role VARCHAR2(15);
    random_site VARCHAR2(15);
    random_name VARCHAR2(6);
    random_password VARCHAR2(20);
    random_lastname VARCHAR2(8);
    random_company VARCHAR2(10);
    random_group INT;
BEGIN
    FOR j IN 1..50 LOOP
        SELECT "role" INTO random_role FROM GLPI_PAU.REF_ROLE ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT "site" INTO random_site FROM GLPI_PAU.LOCATIONS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT "group_id" INTO random_group FROM GLPI_PAU.REF_GROUP ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        random_name := DBMS_RANDOM.STRING('X', 6);
        random_lastname := DBMS_RANDOM.STRING('X', 8);
        random_company := DBMS_RANDOM.STRING('X', 10);
        random_password := DBMS_RANDOM.STRING('A', 7) || DBMS_RANDOM.STRING('a', 7) || '123?';
        GLPI_PAU.NEW_USER(random_role, random_group, random_password, random_name || '_de_pau@gmail.com', random_name || ' de Pau', random_lastname, random_company, random_site);
    END LOOP;
END;
/

-- Inserts pour RESSOURCES
INSERT INTO GLPI_PAU.RESSOURCES (ressource_id, ressource) VALUES (1, 'H:/TEST/test.txt');
INSERT INTO GLPI_PAU.RESSOURCES (ressource_id, ressource) VALUES (2, 'H:/TEST/ui.g');
INSERT INTO GLPI_PAU.RESSOURCES (ressource_id, ressource) VALUES (3, 'H:/ahah.bis');
INSERT INTO GLPI_PAU.RESSOURCES (ressource_id, ressource) VALUES (4, 'H:/ahfe.bis');
INSERT INTO GLPI_PAU.RESSOURCES (ressource_id, ressource) VALUES (5, 'H:/afefefeh.bis');
DECLARE
    i NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO GLPI_PAU.RESSOURCES (ressource_id, ressource) VALUES (0, 'H:/'||DBMS_RANDOM.STRING('X', 6)||'.txt');
    END LOOP;
END;
/
    

-- Inserts pour TICKETS
EXECUTE GLPI_PAU.NEW_TICKET(1, 'Incident', 'Emergency', 'Software', 1, 'Requesting update for Adobe Acrobat Reader.', 'Software Update Request', '', 1, 1);
EXECUTE GLPI_PAU.NEW_TICKET(1, 'Incident', 'Urgent', 'Network', 2, 'Change needed in network configuration for new branch office.', 'Network Configuration Change', '', 1, 1);
EXECUTE GLPI_PAU.NEW_TICKET(2, 'Change', 'Normal', 'Security', 3, 'Requesting security training for new employees.', 'Security Training Request', '', 3, 2);
EXECUTE GLPI_PAU.NEW_TICKET(2, 'Change', 'Normal', 'Software', 2, 'Unable to access sales report on server.', 'Sales Report Access Issue', '', 2, NULL);
EXECUTE GLPI_PAU.NEW_TICKET(1, 'Incident', 'Emergency', 'Software', 1, 'Seeking information regarding product pricing.', 'General Inquiry', '', 2, 5);
EXECUTE GLPI_PAU.NEW_TICKET(2, 'Incident', 'Urgent', 'Software', 2, 'Unable to access email client.', 'Email Access Issue', '', 1, 3);
EXECUTE GLPI_PAU.NEW_TICKET(3, 'Change', 'Normal', 'Network', 3, 'Requesting firewall configuration change.', 'Firewall Configuration Change Request', '', 2, 4);
EXECUTE GLPI_PAU.NEW_TICKET(4, 'Incident', 'Low', 'Software', 1, 'Reporting slow system performance.', 'System Performance Issue', '', 3, 5);
EXECUTE GLPI_PAU.NEW_TICKET(5, 'Incident', 'Emergency', 'Network', 2, 'Network outage in the main office.', 'Network Outage', '', 2, NULL);
EXECUTE GLPI_PAU.NEW_TICKET(6, 'Change', 'Normal', 'Security', 3, 'Requesting access to restricted folder.', 'Access Request', '', 1, 1);
EXECUTE GLPI_PAU.NEW_TICKET(7, 'Incident', 'Normal', 'Software', 1, 'Installation issue with new software update.', 'Installation Issue', '', 3, 2);
EXECUTE GLPI_PAU.NEW_TICKET(8, 'Change', 'Urgent', 'Network', 2, 'Network switch replacement required.', 'Switch Replacement Request', '', 2, 4);
EXECUTE GLPI_PAU.NEW_TICKET(9, 'Incident', 'Emergency', 'Software', 3, 'Critical error message on server.', 'Server Error', '', 1, 5);
EXECUTE GLPI_PAU.NEW_TICKET(10, 'Change', 'Normal', 'Security', 1, 'Requesting password reset for user account.', 'Password Reset Request', '', 2, 3);
EXECUTE GLPI_PAU.NEW_TICKET(11, 'Incident', 'Urgent', 'Software', 2, 'Data loss in database.', 'Data Loss Issue', '', 2, 2);
DECLARE
    j NUMBER;
    random_type VARCHAR2(15);
    random_priority VARCHAR2(15);
    random_category VARCHAR2(15);
    random_site VARCHAR2(15);
    random_title VARCHAR2(50);
    random_description VARCHAR2(100);
    random_group INT;
    random_hardware INT;
    random_ressource INT;
    random_user INT;
BEGIN
    FOR j IN 1..80 LOOP
        SELECT "type" INTO random_type FROM GLPI_PAU.REF_TYPE ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT "priority" INTO random_priority FROM GLPI_PAU.REF_PRIORITY ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT "category" INTO random_category FROM GLPI_PAU.REF_CATEGORY ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT "site" INTO random_site FROM GLPI_PAU.LOCATIONS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT "group_id" INTO random_group FROM GLPI_PAU.REF_GROUP ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT ressource_id INTO random_ressource FROM GLPI_PAU.RESSOURCES ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT hardware_id INTO random_hardware FROM GLPI_PAU.HARDWARES ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT user_id INTO random_user FROM GLPI_PAU.USERS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        random_title := DBMS_RANDOM.STRING('X', 50);
        random_description := DBMS_RANDOM.STRING('X', 100);
        GLPI_PAU.NEW_TICKET(random_user, random_type, random_priority, random_category, random_group, random_title, random_description, random_site, random_hardware, random_ressource);
    END LOOP;
END;
/

-- Inserts pour COMMENTS
EXECUTE GLPI_PAU.NEW_COMMENT(1, NULL, 2, 'Request Details', 'Please ensure that the latest version of Adobe Acrobat Reader is installed.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(1, NULL, 3, 'Change Request Details', 'The new branch office is located in downtown area.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(1, NULL, 2, 'Training Details', 'The security training should cover basic awareness and best practices.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(2, NULL, 3, 'Access Issue Details', 'Error message indicates permission denied.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(3, NULL, 1, 'Inquiry Details', 'Interested in bulk purchasing options.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(4, NULL, 1, 'Update Request', 'Could you please provide an estimated time for the software update?', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(5, NULL, 2, 'Configuration Details', 'Ensure that the new branch office network configuration aligns with our security policies.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(6, NULL, 2, 'Error Analysis', 'Investigating the access issue further to identify the root cause.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(7, NULL, 3, 'Pricing Inquiry', 'We offer discounted rates for bulk purchases. I will send you the details shortly.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(8, NULL, 4, 'Permission Issue', 'Checking the firewall logs for any denied access attempts.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(8, NULL, 1, 'Update Progress', 'The update process has started. Will keep you updated on the progress.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(3, NULL, 2, 'Configuration Confirmation', 'Confirming the location and IP range for the new branch office.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(1, NULL, 2, 'Access Issue Resolution', 'Resolved the access issue by updating the permissions for the sales report folder.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(2, NULL, 3, 'Pricing Details', 'The discounted rates for bulk purchases have been emailed to you. Please check your inbox.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(3, NULL, 4, 'Firewall Logs Analysis', 'No denied access attempts found in the firewall logs. Investigating further.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(4, NULL, 1, 'Update Progress', 'The Adobe Acrobat Reader update has been successfully installed. Verifying functionality now.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(5, NULL, 2, 'Configuration Confirmation', 'The IP range has been confirmed for the new branch office. Configuration changes will be applied shortly.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(6, NULL, 2, 'Access Issue Resolution', 'Permissions have been updated, and the access issue has been resolved. Users can now access the sales report without any errors.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(7, NULL, 3, 'Training Schedule', 'The security training session has been scheduled for next Monday. Invitations will be sent out to all new employees shortly.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(1, NULL, 4, 'Pricing Confirmation', 'Confirming receipt of the pricing details. We will review the rates and get back to you with any questions.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(4, NULL, 5, 'General Inquiry Response', 'Thank you for your inquiry. Our sales team will reach out to discuss bulk purchasing options and provide further assistance.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(2, NULL, 1, 'Update Verification', 'Verified that the latest version of Adobe Acrobat Reader is installed and functioning correctly. Ticket can now be closed.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(1, NULL, 2, 'Configuration Applied', 'Configuration changes for the new branch office have been successfully applied. Network connectivity has been tested and is stable.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(2, NULL, 3, 'Training Session Reminder', 'A reminder email has been sent out to all employees regarding the upcoming security training session. Please ensure attendance.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(3, NULL, 4, 'Pricing Review', 'Reviewed the provided pricing details. Everything looks good, and we are proceeding with the bulk purchase order.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(4, NULL, 5, 'Follow-Up Action', 'Our sales team has initiated contact to discuss bulk purchasing options. Please check your inbox for further communication.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(5, NULL, 1, 'Ticket Closure', 'Confirmed successful resolution of the software update request. Closing the ticket now. Thank you for your cooperation.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(6, NULL, 2, 'Configuration Validation', 'Validation tests have been conducted, and the new branch office configuration is functioning as expected. Ticket status can be updated to "Done."', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(7, NULL, 3, 'Training Session Feedback', 'Thank you for attending the security training session. Your feedback is valuable in improving our training programs.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(8, NULL, 4, 'Purchase Confirmation', 'The bulk purchase order has been confirmed, and delivery is scheduled for next week. We appreciate your business.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(7, NULL, 5, 'Sales Discussion Initiated', 'Our sales team has initiated discussions regarding bulk purchasing options. Please let us know if you have any specific requirements.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(3, NULL, 1, 'Final Update', 'This concludes the ticket resolution process. If you encounter any further issues, feel free to reopen the ticket. Thank you for choosing our services.', 2);
EXECUTE GLPI_PAU.NEW_COMMENT(5, NULL, 2, 'Final Configuration Check', 'Performed a final check on the branch office configuration. Everything appears to be in order. Requesting final approval to close the ticket.', 3);
EXECUTE GLPI_PAU.NEW_COMMENT(2, NULL, 3, 'Training Session Completion', 'The security training session has been successfully completed. Certificates of completion will be distributed shortly.', 1);
EXECUTE GLPI_PAU.NEW_COMMENT(3, NULL, 4, 'Order Shipment Notification', 'Your bulk purchase order has been shipped. Tracking details have been emailed to you for reference. Thank you for your business.', 2);
DECLARE
    k NUMBER;
    random_task VARCHAR2(50);
    random_content VARCHAR2(100);
    random_ressource INT;
    random_user INT;
    random_comment INT;
    random_ticket INT;
BEGIN
    FOR k IN 1..100 LOOP
        SELECT ressource_id INTO random_ressource FROM GLPI_PAU.RESSOURCES ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT user_id INTO random_user FROM GLPI_PAU.USERS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT comment_id INTO random_comment FROM GLPI_PAU.COMMENTS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT ticket_id INTO random_ticket FROM GLPI_PAU.TICKETS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        random_task := DBMS_RANDOM.STRING('X', 50);
        random_content := DBMS_RANDOM.STRING('X', 100);
        GLPI_PAU.NEW_COMMENT(random_user, random_comment, random_ticket, random_task, random_content, random_ressource);
    END LOOP;
END;
/

-- Inserts pour TICKET_RESSOURCES
INSERT INTO GLPI_PAU.TICKET_RESSOURCES (fk_ressource, fk_ticket) VALUES (1, 4); 
DECLARE
    l NUMBER;
    random_ressource INT;
    random_ticket INT;
BEGIN
    FOR l IN 1..20 LOOP
        SELECT ressource_id INTO random_ressource FROM GLPI_PAU.RESSOURCES ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT ticket_id INTO random_ticket FROM GLPI_PAU.TICKETS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
         BEGIN
            INSERT INTO GLPI_PAU.TICKET_RESSOURCES (fk_ressource, fk_ticket) VALUES (random_ressource, random_ticket);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('INSERT IGNORE, already exist');
        END;
    END LOOP;
END;
/

-- Inserts pour COMMENT_RESSOURCES
INSERT INTO GLPI_PAU.COMMENT_RESSOURCES (fk_ressource, fk_comment) VALUES (4, 1);
INSERT INTO GLPI_PAU.COMMENT_RESSOURCES (fk_ressource, fk_comment) VALUES (4, 2);
DECLARE
    m NUMBER;
    random_ressource INT;
    random_comment INT;
BEGIN
    FOR m IN 1..20 LOOP
        SELECT ressource_id INTO random_ressource FROM GLPI_PAU.RESSOURCES ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT comment_id INTO random_comment FROM GLPI_PAU.COMMENTS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
         BEGIN
            INSERT INTO GLPI_PAU.COMMENT_RESSOURCES (fk_ressource, fk_comment) VALUES (random_ressource, random_comment);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('INSERT IGNORE, already exist');
        END;
    END LOOP;
END;
/

-- Inserts pour OBSERVERS
EXECUTE GLPI_PAU.ADD_REMOVE_OBSERVER_OF_TICKET(2, 1);
EXECUTE GLPI_PAU.ADD_REMOVE_OBSERVER_OF_TICKET(3, 1);
EXECUTE GLPI_PAU.ADD_REMOVE_OBSERVER_OF_TICKET(4, 2);
EXECUTE GLPI_PAU.ADD_REMOVE_OBSERVER_OF_TICKET(5, 2);
DECLARE
    n NUMBER;
    random_user INT;
    random_ticket INT;
BEGIN
    FOR n IN 1..20 LOOP
        SELECT user_id INTO random_user FROM GLPI_PAU.USERS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT ticket_id INTO random_ticket FROM GLPI_PAU.TICKETS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        BEGIN
            GLPI_PAU.ADD_REMOVE_OBSERVER_OF_TICKET(random_ticket, random_user);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('INSERT IGNORE, already exist');
        END;
    END LOOP;
END;
/

-- Inserts pour ASSIGNED_TO
EXECUTE GLPI_PAU.ASSIGN_TICKET_TO_USER(2, 1);
EXECUTE GLPI_PAU.ASSIGN_TICKET_TO_USER(2, 2);
EXECUTE GLPI_PAU.ASSIGN_TICKET_TO_USER(3, 1);
EXECUTE GLPI_PAU.ASSIGN_TICKET_TO_USER(4, 1);
EXECUTE GLPI_PAU.ASSIGN_TICKET_TO_USER(5, 2);
DECLARE
    o NUMBER;
    random_user INT;
    random_ticket INT;
BEGIN
    FOR o IN 1..10 LOOP
        SELECT user_id INTO random_user FROM GLPI_PAU.USERS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        SELECT ticket_id INTO random_ticket FROM GLPI_PAU.TICKETS ORDER BY DBMS_RANDOM.VALUE FETCH FIRST 1 ROW ONLY;
        BEGIN
            GLPI_PAU.ASSIGN_TICKET_TO_USER(random_ticket, random_user);
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('INSERT IGNORE, already exist');
        END;
    END LOOP;
END;
/

COMMIT;
exit;
