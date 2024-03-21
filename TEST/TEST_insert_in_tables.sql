-- Inserts suppl�mentaires pour REF_priority
INSERT INTO GLPI_TEST.REF_priority (priority_id, "priority") VALUES (1, 'Emergency');
INSERT INTO GLPI_TEST.REF_priority (priority_id, "priority") VALUES (2, 'Urgent');
INSERT INTO GLPI_TEST.REF_priority (priority_id, "priority") VALUES (3, 'Normal');
INSERT INTO GLPI_TEST.REF_priority (priority_id, "priority") VALUES (4, 'Low');
INSERT INTO GLPI_TEST.REF_priority (priority_id, "priority") VALUES (5, 'Infos');

-- Inserts suppl�mentaires pour REF_status
INSERT INTO GLPI_TEST.REF_status (status_id, status) VALUES (1, 'To do');
INSERT INTO GLPI_TEST.REF_status (status_id, status) VALUES (2, 'In Progress');
INSERT INTO GLPI_TEST.REF_status (status_id, status) VALUES (3, 'Done');

-- Inserts suppl�mentaires pour REF_category
INSERT INTO GLPI_TEST.REF_category (category_id, "category") VALUES (1, 'Software');
INSERT INTO GLPI_TEST.REF_category (category_id, "category") VALUES (2, 'Network');
INSERT INTO GLPI_TEST.REF_category (category_id, "category") VALUES (3, 'Security');

-- Inserts suppl�mentaires pour REF_type
INSERT INTO GLPI_TEST.REF_type (type_id, "type") VALUES (1, 'Incident');
INSERT INTO GLPI_TEST.REF_type (type_id, "type") VALUES (2, 'Change');

-- Inserts suppl�mentaires pour REF_role
INSERT INTO GLPI_TEST.REF_role (role_id, "role") VALUES (1, 'Manager');
INSERT INTO GLPI_TEST.REF_role (role_id, "role") VALUES (2, 'Technician');
INSERT INTO GLPI_TEST.REF_role (role_id, "role") VALUES (3, 'Customer');

-- Inserts suppl�mentaires pour REF_group
INSERT INTO GLPI_TEST.REF_group ("group_id", "group") VALUES (1, 'Development Team');
INSERT INTO GLPI_TEST.REF_group ("group_id", "group") VALUES (2, 'Quality Assurance Team');
INSERT INTO GLPI_TEST.REF_group ("group_id", "group") VALUES (3, 'Sales Department');

-- Inserts suppl�mentaires pour LOCATIONS
INSERT INTO GLPI_TEST.LOCATIONS (location_id, "location", "site", city) VALUES (1, 'Building A, Floor 1', 'Site 1', 'City 1');
INSERT INTO GLPI_TEST.LOCATIONS (location_id, "location", "site", city) VALUES (2, 'Building B, Basement', 'Site 2', 'City 2');
INSERT INTO GLPI_TEST.LOCATIONS (location_id, "location", "site", city) VALUES (3, 'Building C, Floor 2', 'Site 3', 'City 3');
INSERT INTO GLPI_TEST.LOCATIONS (location_id, "location", "site", city) VALUES (4, 'Warehouse', 'Site 4', 'City 4');

-- Inserts suppl�mentaires pour HARDWARES
INSERT INTO GLPI_TEST.HARDWARES (hardware_id, "name", "model", brand) VALUES (1, 'Laptop 1','HP 6','HP');
INSERT INTO GLPI_TEST.HARDWARES (hardware_id, "name", "model", brand) VALUES (2, 'Server 1','Cisco 2', 'Cisco');
INSERT INTO GLPI_TEST.HARDWARES (hardware_id, "name", "model", brand) VALUES (3, 'Switch 1','Cisco Switch 1', 'Cisco');

-- Inserts suppl�mentaires pour USERS
INSERT INTO GLPI_TEST.USERS (user_id, fk_role, fk_group, "password", email ,last_name, first_name, company, fk_location) VALUES (1, 3, 3, 'Password1234???', 'Cc@gmail.com', 'Williams', 'Emily', '123 Industries', 1);
INSERT INTO GLPI_TEST.USERS (user_id, fk_role, fk_group, "password", email ,last_name, first_name, company, fk_location) VALUES (2, 2, 2, 'Password1234???', 'Dd@gmail.com', 'Brown', 'Michael', '456 Corporation', 2);
INSERT INTO GLPI_TEST.USERS (user_id, fk_role, fk_group, "password", email ,last_name, first_name, company, fk_location) VALUES (3, 1, 2, 'Password1234???', 'Ee@gmail.com', 'Jones', 'Jessica', '789 Enterprises', 3);
INSERT INTO GLPI_TEST.USERS (user_id, fk_role, fk_group, "password", email ,last_name, first_name, company, fk_location) VALUES (4, 2, 1, 'Password1234???', 'Ff@gmail.com', 'Davis', 'Matthew', 'ABC Corp', 2);
INSERT INTO GLPI_TEST.USERS (user_id, fk_role, fk_group, "password", email ,last_name, first_name, company, fk_location) VALUES (5, 3, 1, 'Password1234???', 'Gg@gmail.com', 'Taylor', 'Daniel', 'XYZ Ltd', 1);

-- Inserts suppl�mentaires pour TICKETS
INSERT INTO GLPI_TEST.TICKETS (ticket_id, fk_created_by, fk_type, fk_priority, title, "description", fk_location, creation_datetime, last_modification_datetime, resolution_datetime, resolution_note, closing_datetime, fk_assigned_group, fk_status, fk_category, fk_hardwares) VALUES (1, 1, 1, 1, 'Software Update Request', 'Requesting update for Adobe Acrobat Reader.', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, 1, 2, 3, NULL);
INSERT INTO GLPI_TEST.TICKETS (ticket_id, fk_created_by, fk_type, fk_priority, title, "description", fk_location, creation_datetime, last_modification_datetime, resolution_datetime, resolution_note, closing_datetime, fk_assigned_group, fk_status, fk_category, fk_hardwares) VALUES (2, 1, 1, 2, 'Network Configuration Change', 'Change needed in network configuration for new branch office.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, 2, 2, 3, NULL);
INSERT INTO GLPI_TEST.TICKETS (ticket_id, fk_created_by, fk_type, fk_priority, title, "description", fk_location, creation_datetime, last_modification_datetime, resolution_datetime, resolution_note, closing_datetime, fk_assigned_group, fk_status, fk_category, fk_hardwares) VALUES (3, 2, 2, 3, 'Security Training Request', 'Requesting security training for new employees.', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, 3, 3, 1, NULL);
INSERT INTO GLPI_TEST.TICKETS (ticket_id, fk_created_by, fk_type, fk_priority, title, "description", fk_location, creation_datetime, last_modification_datetime, resolution_datetime, resolution_note, closing_datetime, fk_assigned_group, fk_status, fk_category, fk_hardwares) VALUES (4, 2, 2, 3, 'Sales Report Access Issue', 'Unable to access sales report on server.', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, 1, 2, 1, 2);
INSERT INTO GLPI_TEST.TICKETS (ticket_id, fk_created_by, fk_type, fk_priority, title, "description", fk_location, creation_datetime, last_modification_datetime, resolution_datetime, resolution_note, closing_datetime, fk_assigned_group, fk_status, fk_category, fk_hardwares) VALUES (5, 2, 1, 1, 'General Inquiry', 'Seeking information regarding product pricing.', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, 2, 1, 3, NULL);

-- Inserts suppl�mentaires pour COMMENTS
INSERT INTO GLPI_TEST.COMMENTS (comment_id, fk_answer_to, fk_ticket, fk_user, creation_datetime, task, "content") VALUES (1, NULL, 2, 1, CURRENT_TIMESTAMP, 'Request Details', 'Please ensure that the latest version of Adobe Acrobat Reader is installed.');
INSERT INTO GLPI_TEST.COMMENTS (comment_id, fk_answer_to, fk_ticket, fk_user, creation_datetime, task, "content") VALUES (2, NULL, 3, 1, CURRENT_TIMESTAMP, 'Change Request Details', 'The new branch office is located in downtown area.');
INSERT INTO GLPI_TEST.COMMENTS (comment_id, fk_answer_to, fk_ticket, fk_user, creation_datetime, task, "content") VALUES (3, NULL, 2, 1, CURRENT_TIMESTAMP, 'Training Details', 'The security training should cover basic awareness and best practices.');
INSERT INTO GLPI_TEST.COMMENTS (comment_id, fk_answer_to, fk_ticket, fk_user, creation_datetime, task, "content") VALUES (4, NULL, 3, 2, CURRENT_TIMESTAMP, 'Access Issue Details', 'Error message indicates permission denied.');
INSERT INTO GLPI_TEST.COMMENTS (comment_id, fk_answer_to, fk_ticket, fk_user, creation_datetime, task, "content") VALUES (5, NULL, 1, 3, CURRENT_TIMESTAMP, 'Inquiry Details', 'Interested in bulk purchasing options.');

-- Inserts suppl�mentaires pour RESSOURCES
INSERT INTO GLPI_TEST.RESSOURCES (ressource_id, fk_ticket, ressource) VALUES (1, 1, 'Base64EncodedImageStringHere==');
INSERT INTO GLPI_TEST.RESSOURCES (ressource_id, fk_ticket, ressource) VALUES (2, 2, 'Base64EncodedImageStringHere==');
INSERT INTO GLPI_TEST.RESSOURCES (ressource_id, fk_ticket, ressource) VALUES (3, 3, 'Base64EncodedImageStringHere==');
INSERT INTO GLPI_TEST.RESSOURCES (ressource_id, fk_ticket, ressource) VALUES (4, 4, 'Base64EncodedImageStringHere==');
INSERT INTO GLPI_TEST.RESSOURCES (ressource_id, fk_ticket, ressource) VALUES (5, 5, 'Base64EncodedImageStringHere==');

-- Inserts suppl�mentaires pour TICKET_RESSOURCES
INSERT INTO GLPI_TEST.TICKET_RESSOURCES (fk_ressource, fk_ticket) VALUES (1, 1);
INSERT INTO GLPI_TEST.TICKET_RESSOURCES (fk_ressource, fk_ticket) VALUES (2, 1);
INSERT INTO GLPI_TEST.TICKET_RESSOURCES (fk_ressource, fk_ticket) VALUES (3, 2);
INSERT INTO GLPI_TEST.TICKET_RESSOURCES (fk_ressource, fk_ticket) VALUES (4, 2);
INSERT INTO GLPI_TEST.TICKET_RESSOURCES (fk_ressource, fk_ticket) VALUES (5, 3);

-- Inserts suppl�mentaires pour COMMENT_RESSOURCES
INSERT INTO GLPI_TEST.COMMENT_RESSOURCES (fk_ressource, fk_comment) VALUES (5, 1);
INSERT INTO GLPI_TEST.COMMENT_RESSOURCES (fk_ressource, fk_comment) VALUES (5, 2);

-- Inserts suppl�mentaires pour OBSERVERS
INSERT INTO GLPI_TEST.OBSERVERS (fk_ticket, fk_user) VALUES (2, 1);
INSERT INTO GLPI_TEST.OBSERVERS (fk_ticket, fk_user) VALUES (3, 1);
INSERT INTO GLPI_TEST.OBSERVERS (fk_ticket, fk_user) VALUES (4, 2);
INSERT INTO GLPI_TEST.OBSERVERS (fk_ticket, fk_user) VALUES (5, 2);

-- Inserts suppl�mentaires pour ASSIGNED_TO
INSERT INTO GLPI_TEST.ASSIGNED_TO (fk_ticket, fk_user) VALUES (2, 1);
INSERT INTO GLPI_TEST.ASSIGNED_TO (fk_ticket, fk_user) VALUES (3, 1);
INSERT INTO GLPI_TEST.ASSIGNED_TO (fk_ticket, fk_user) VALUES (4, 1);
INSERT INTO GLPI_TEST.ASSIGNED_TO (fk_ticket, fk_user) VALUES (5, 2);

COMMIT;
exit;