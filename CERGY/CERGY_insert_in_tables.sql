-- Inserts pour REF_priority
INSERT INTO GLPI_CERGY.REF_priority (priority_id, "priority") VALUES (1, 'Emergency');
INSERT INTO GLPI_CERGY.REF_priority (priority_id, "priority") VALUES (2, 'Urgent');
INSERT INTO GLPI_CERGY.REF_priority (priority_id, "priority") VALUES (3, 'Normal');
INSERT INTO GLPI_CERGY.REF_priority (priority_id, "priority") VALUES (4, 'Low');
INSERT INTO GLPI_CERGY.REF_priority (priority_id, "priority") VALUES (5, 'Infos');

-- Inserts pour REF_status
INSERT INTO GLPI_CERGY.REF_status (status_id, status) VALUES (1, 'To do');
INSERT INTO GLPI_CERGY.REF_status (status_id, status) VALUES (2, 'In Progress');
INSERT INTO GLPI_CERGY.REF_status (status_id, status) VALUES (3, 'Done');

-- Inserts pour REF_category
INSERT INTO GLPI_CERGY.REF_category (category_id, "category") VALUES (1, 'Software');
INSERT INTO GLPI_CERGY.REF_category (category_id, "category") VALUES (2, 'Network');
INSERT INTO GLPI_CERGY.REF_category (category_id, "category") VALUES (3, 'Security');

-- Inserts pour REF_type
INSERT INTO GLPI_CERGY.REF_type (type_id, "type") VALUES (1, 'Incident');
INSERT INTO GLPI_CERGY.REF_type (type_id, "type") VALUES (2, 'Change');
INSERT INTO GLPI_CERGY.REF_type (type_id, "type") VALUES (3, 'Service Request');
INSERT INTO GLPI_CERGY.REF_type (type_id, "type") VALUES (4, 'Bug Report');

-- Inserts pour REF_role
INSERT INTO GLPI_CERGY.REF_role (role_id, "role") VALUES (1, 'Manager');
INSERT INTO GLPI_CERGY.REF_role (role_id, "role") VALUES (2, 'Technician');
INSERT INTO GLPI_CERGY.REF_role (role_id, "role") VALUES (3, 'Customer');
INSERT INTO GLPI_CERGY.REF_role (role_id, "role") VALUES (4, 'Administrator');

-- Inserts pour REF_group
INSERT INTO GLPI_CERGY.REF_group ("group_id", "group") VALUES (1, 'Development Team');
INSERT INTO GLPI_CERGY.REF_group ("group_id", "group") VALUES (2, 'Quality Assurance Team');
INSERT INTO GLPI_CERGY.REF_group ("group_id", "group") VALUES (3, 'Sales Department');

-- Inserts pour LOCATIONS
INSERT INTO GLPI_CERGY.LOCATIONS (location_id, "location", "site", city) VALUES (1, '', 'Fermat', 'Cergy');
INSERT INTO GLPI_CERGY.LOCATIONS (location_id, "location", "site", city) VALUES (2, '', 'St Martin', 'Cergy');
INSERT INTO GLPI_CERGY.LOCATIONS (location_id, "location", "site", city) VALUES (3, '', 'Parc', 'Cergy');

-- Inserts pour HARDWARES
INSERT INTO GLPI_CERGY.HARDWARES (hardware_id, "name", "model", brand) VALUES (1, 'Laptop 1','HP 6','HP');
INSERT INTO GLPI_CERGY.HARDWARES (hardware_id, "name", "model", brand) VALUES (2, 'Server 1','Cisco 2', 'Cisco');
INSERT INTO GLPI_CERGY.HARDWARES (hardware_id, "name", "model", brand) VALUES (3, 'Switch 1','Cisco Switch 1', 'Cisco');
    
-- Inserts pour USERS
EXECUTE GLPI_CERGY.NEW_USER('Customer', 3, 'Password1234???', 'william_de_cergy@gmail.com', 'Williams de Cergy', 'Emily', '123 Industries', 'Parc');
EXECUTE GLPI_CERGY.NEW_USER('Technician', 2, 'Password1234???', 'brown_de_cergy@gmail.com', 'Brown de Cergy', 'Michael', '456 Corporation', 'St Martin');
EXECUTE GLPI_CERGY.NEW_USER('Manager', 2, 'Password1234???', 'jones_de_cergy@gmail.com', 'Jones de Cergy', 'Jessica', '789 Enterprises', 'Fermat');
EXECUTE GLPI_CERGY.NEW_USER('Technician', 1, 'Password1234???', 'davis_de_cergy@gmail.com', 'Davis de Cergy', 'Matthew', 'ABC Corp', 'Fermat');
EXECUTE GLPI_CERGY.NEW_USER('Customer', 1, 'Password1234???', 'taylor_de_cergy@gmail.com', 'Taylor de Cergy', 'Daniel', 'XYZ Ltd', 'St Martin');
EXECUTE GLPI_CERGY.NEW_USER('Manager', 2, 'Password1234???', 'rodriguez_de_cergy@gmail.com', 'Rodriguez de Cergy', 'Olivia', 'XYZ Ltd', 'Fermat');
EXECUTE GLPI_CERGY.NEW_USER('Customer', 3, 'Password1234???', 'martinez_de_cergy@gmail.com', 'Martinez de Cergy', 'Liam', 'ABC Corp', 'Parc');
EXECUTE GLPI_CERGY.NEW_USER('Technician', 1, 'Password1234???', 'lopez_de_cergy@gmail.com', 'Lopez de Cergy', 'Ethan', '456 Corporation', 'Fermat');
EXECUTE GLPI_CERGY.NEW_USER('Administrator', 2, 'Password1234???', 'gonzalez_de_cergy@gmail.com', 'Gonzalez de Cergy', 'Ava', '123 Industries', 'St Martin');
EXECUTE GLPI_CERGY.NEW_USER('Manager', 3, 'Password1234???', 'hernandez_de_cergy@gmail.com', 'Hernandez de Cergy', 'Mia', '789 Enterprises', 'Parc');
EXECUTE GLPI_CERGY.NEW_USER('Administrator', 2, 'Password1234???', 'williams_de_cergy@gmail.com', 'Williams de Cergy Jr', 'Liam Jr', 'XYZ Ltd Jr', 'St Martin');
EXECUTE GLPI_CERGY.NEW_USER('Technician', 3, 'Password1234???', 'brown_de_cergy@gmail.com', 'Brown de Cergy Jr', 'Ethan Jr', 'ABC Corp Jr', 'Fermat');
EXECUTE GLPI_CERGY.NEW_USER('Manager', 3, 'Password1234???', 'jones_de_cergy@gmail.com', 'Jones de Cergy Jr', 'Ava Jr', '456 Corporation Jr', 'St Martin');
EXECUTE GLPI_CERGY.NEW_USER('Technician', 3, 'Password1234???', 'davido_de_cergy@gmail.com', 'Davis de Cergy Jr', 'Mia Jr', '123 Industries Jr', 'Parc');
EXECUTE GLPI_CERGY.NEW_USER('Customer', 1, 'Password1234???', 'talyah_de_cergy@gmail.com', 'Taylor de Cergy Jr', 'Olivia Jr', '789 Enterprises Jr', 'Fermat');
EXECUTE GLPI_CERGY.NEW_USER('Administrator', 1, 'Password1234???', 'martin_de_cergy@gmail.com', 'Martinez de Cergy Jr', 'Liam Jr', 'XYZ Ltd Jr', 'Parc');
EXECUTE GLPI_CERGY.NEW_USER('Technician', 3, 'Password1234???', 'lopez_de_cergy@gmail.com', 'Lopez de Cergy Jr', 'Ethan Jr', 'ABC Corp Jr', 'St Martin');
EXECUTE GLPI_CERGY.NEW_USER('Manager', 1, 'Password1234???', 'gonza_de_cergy@gmail.com', 'Gonzalez de Cergy Jr', 'Ava Jr', '456 Corporation Jr', 'Fermat');
EXECUTE GLPI_CERGY.NEW_USER('Technician', 3, 'Password1234???', 'hermado_de_cergy@gmail.com', 'Hernandez de Cergy Jr', 'Mia Jr', '123 Industries Jr', 'St Martin');
EXECUTE GLPI_CERGY.NEW_USER('Customer', 1, 'Password1234???', 'rodriguo_de_cergy@gmail.com', 'Rodriguo de Cergy Jr', 'Olivia Jr', '789 Enterprises Jr', 'Fermat');


-- Inserts pour RESSOURCES
INSERT INTO GLPI_CERGY.RESSOURCES (ressource_id, ressource) VALUES (1, 'H:/TEST/test.txt');
INSERT INTO GLPI_CERGY.RESSOURCES (ressource_id, ressource) VALUES (2, 'H:/TEST/ui.g');
INSERT INTO GLPI_CERGY.RESSOURCES (ressource_id, ressource) VALUES (3, 'H:/ahah.bis');
INSERT INTO GLPI_CERGY.RESSOURCES (ressource_id, ressource) VALUES (4, 'H:/ahfe.bis');
INSERT INTO GLPI_CERGY.RESSOURCES (ressource_id, ressource) VALUES (5, 'H:/afefefeh.bis');

-- Inserts pour TICKETS
EXECUTE GLPI_CERGY.NEW_TICKET(1, 'Incident', 'Emergency', 'Software', 1, 'Requesting update for Adobe Acrobat Reader.', 'Software Update Request', 'Fermat', 1, 1);
EXECUTE GLPI_CERGY.NEW_TICKET(1, 'Incident', 'Urgent', 'Network', 2, 'Change needed in network configuration for new branch office.', 'Network Configuration Change', 'Fermat', 1, 1);
EXECUTE GLPI_CERGY.NEW_TICKET(2, 'Change', 'Normal', 'Security', 3, 'Requesting security training for new employees.', 'Security Training Request', 'St Martin', 3, 2);
EXECUTE GLPI_CERGY.NEW_TICKET(2, 'Change', 'Normal', 'Software', 2, 'Unable to access sales report on server.', 'Sales Report Access Issue', 'Parc', 2, NULL);
EXECUTE GLPI_CERGY.NEW_TICKET(1, 'Incident', 'Emergency', 'Software', 1, 'Seeking information regarding product pricing.', 'General Inquiry', 'Parc', 2, 5);
EXECUTE GLPI_CERGY.NEW_TICKET(2, 'Incident', 'Urgent', 'Software', 2, 'Unable to access email client.', 'Email Access Issue', 'Parc', 1, 3);
EXECUTE GLPI_CERGY.NEW_TICKET(3, 'Change', 'Normal', 'Network', 3, 'Requesting firewall configuration change.', 'Firewall Configuration Change Request', 'Parc', 2, 4);
EXECUTE GLPI_CERGY.NEW_TICKET(4, 'Incident', 'Low', 'Software', 1, 'Reporting slow system performance.', 'System Performance Issue', 'Parc', 3, 5);
EXECUTE GLPI_CERGY.NEW_TICKET(5, 'Incident', 'Emergency', 'Network', 2, 'Network outage in the main office.', 'Network Outage', 'Fermat', 2, NULL);
EXECUTE GLPI_CERGY.NEW_TICKET(6, 'Change', 'Normal', 'Security', 3, 'Requesting access to restricted folder.', 'Access Request', 'Fermat', 1, 1);
EXECUTE GLPI_CERGY.NEW_TICKET(7, 'Incident', 'Normal', 'Software', 1, 'Installation issue with new software update.', 'Installation Issue', 'St Martin', 3, 2);
EXECUTE GLPI_CERGY.NEW_TICKET(8, 'Change', 'Urgent', 'Network', 2, 'Network switch replacement required.', 'Switch Replacement Request', 'Parc', 2, 4);
EXECUTE GLPI_CERGY.NEW_TICKET(9, 'Incident', 'Emergency', 'Software', 3, 'Critical error message on server.', 'Server Error', 'Fermat', 1, 5);
EXECUTE GLPI_CERGY.NEW_TICKET(10, 'Change', 'Normal', 'Security', 1, 'Requesting password reset for user account.', 'Password Reset Request', 'St Martin', 2, 3);
EXECUTE GLPI_CERGY.NEW_TICKET(11, 'Incident', 'Urgent', 'Software', 2, 'Data loss in database.', 'Data Loss Issue', 'Parc', 2, 2);

-- Inserts pour COMMENTS
EXECUTE GLPI_CERGY.NEW_COMMENT(1, 1, 2, 'Request Details', 'Please ensure that the latest version of Adobe Acrobat Reader is installed.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(1, 1, 3, 'Change Request Details', 'The new branch office is located in downtown area.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(1, 2, 2, 'Training Details', 'The security training should cover basic awareness and best practices.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(2, 2, 3, 'Access Issue Details', 'Error message indicates permission denied.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(3, 2, 1, 'Inquiry Details', 'Interested in bulk purchasing options.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(4, 3, 1, 'Update Request', 'Could you please provide an estimated time for the software update?', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(5, 2, 2, 'Configuration Details', 'Ensure that the new branch office network configuration aligns with our security policies.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(6, 4, 2, 'Error Analysis', 'Investigating the access issue further to identify the root cause.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(7, 3, 3, 'Pricing Inquiry', 'We offer discounted rates for bulk purchases. I will send you the details shortly.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(8, 1, 4, 'Permission Issue', 'Checking the firewall logs for any denied access attempts.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(8, 5, 1, 'Update Progress', 'The update process has started. Will keep you updated on the progress.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(3, 1, 2, 'Configuration Confirmation', 'Confirming the location and IP range for the new branch office.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(1, 2, 2, 'Access Issue Resolution', 'Resolved the access issue by updating the permissions for the sales report folder.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(2, 4, 3, 'Pricing Details', 'The discounted rates for bulk purchases have been emailed to you. Please check your inbox.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(3, 3, 4, 'Firewall Logs Analysis', 'No denied access attempts found in the firewall logs. Investigating further.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(4, 5, 1, 'Update Progress', 'The Adobe Acrobat Reader update has been successfully installed. Verifying functionality now.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(5, 1, 2, 'Configuration Confirmation', 'The IP range has been confirmed for the new branch office. Configuration changes will be applied shortly.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(6, 2, 2, 'Access Issue Resolution', 'Permissions have been updated, and the access issue has been resolved. Users can now access the sales report without any errors.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(7, 3, 3, 'Training Schedule', 'The security training session has been scheduled for next Monday. Invitations will be sent out to all new employees shortly.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(1, 4, 4, 'Pricing Confirmation', 'Confirming receipt of the pricing details. We will review the rates and get back to you with any questions.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(4, 5, 5, 'General Inquiry Response', 'Thank you for your inquiry. Our sales team will reach out to discuss bulk purchasing options and provide further assistance.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(2, 1, 1, 'Update Verification', 'Verified that the latest version of Adobe Acrobat Reader is installed and functioning correctly. Ticket can now be closed.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(1, 2, 2, 'Configuration Applied', 'Configuration changes for the new branch office have been successfully applied. Network connectivity has been tested and is stable.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(2, 3, 3, 'Training Session Reminder', 'A reminder email has been sent out to all employees regarding the upcoming security training session. Please ensure attendance.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(3, 4, 4, 'Pricing Review', 'Reviewed the provided pricing details. Everything looks good, and we are proceeding with the bulk purchase order.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(4, 5, 5, 'Follow-Up Action', 'Our sales team has initiated contact to discuss bulk purchasing options. Please check your inbox for further communication.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(5, 1, 1, 'Ticket Closure', 'Confirmed successful resolution of the software update request. Closing the ticket now. Thank you for your cooperation.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(6, 2, 2, 'Configuration Validation', 'Validation tests have been conducted, and the new branch office configuration is functioning as expected. Ticket status can be updated to "Done."', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(7, 3, 3, 'Training Session Feedback', 'Thank you for attending the security training session. Your feedback is valuable in improving our training programs.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(8, 4, 4, 'Purchase Confirmation', 'The bulk purchase order has been confirmed, and delivery is scheduled for next week. We appreciate your business.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(7, 5, 5, 'Sales Discussion Initiated', 'Our sales team has initiated discussions regarding bulk purchasing options. Please let us know if you have any specific requirements.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(3, 1, 1, 'Final Update', 'This concludes the ticket resolution process. If you encounter any further issues, feel free to reopen the ticket. Thank you for choosing our services.', 2);
EXECUTE GLPI_CERGY.NEW_COMMENT(5, 2, 2, 'Final Configuration Check', 'Performed a final check on the branch office configuration. Everything appears to be in order. Requesting final approval to close the ticket.', 3);
EXECUTE GLPI_CERGY.NEW_COMMENT(2, 3, 3, 'Training Session Completion', 'The security training session has been successfully completed. Certificates of completion will be distributed shortly.', 1);
EXECUTE GLPI_CERGY.NEW_COMMENT(3, 4, 4, 'Order Shipment Notification', 'Your bulk purchase order has been shipped. Tracking details have been emailed to you for reference. Thank you for your business.', 2);

-- Inserts pour TICKET_RESSOURCES
INSERT INTO GLPI_CERGY.TICKET_RESSOURCES (fk_ressource, fk_ticket) VALUES (1, 4); 

-- Inserts pour COMMENT_RESSOURCES
INSERT INTO GLPI_CERGY.COMMENT_RESSOURCES (fk_ressource, fk_comment) VALUES (4, 1);
INSERT INTO GLPI_CERGY.COMMENT_RESSOURCES (fk_ressource, fk_comment) VALUES (4, 2);

-- Inserts pour OBSERVERS
EXECUTE GLPI_CERGY.ADD_REMOVE_OBSERVER_OF_TICKET(2, 1);
EXECUTE GLPI_CERGY.ADD_REMOVE_OBSERVER_OF_TICKET(3, 1);
EXECUTE GLPI_CERGY.ADD_REMOVE_OBSERVER_OF_TICKET(4, 2);
EXECUTE GLPI_CERGY.ADD_REMOVE_OBSERVER_OF_TICKET(5, 2);

-- Inserts pour ASSIGNED_TO
EXECUTE GLPI_CERGY.ASSIGN_TICKET_TO_USER(2, 1);
EXECUTE GLPI_CERGY.ASSIGN_TICKET_TO_USER(2, 2);
EXECUTE GLPI_CERGY.ASSIGN_TICKET_TO_USER(3, 1);
EXECUTE GLPI_CERGY.ASSIGN_TICKET_TO_USER(4, 1);
EXECUTE GLPI_CERGY.ASSIGN_TICKET_TO_USER(5, 2);

COMMIT;
exit;
