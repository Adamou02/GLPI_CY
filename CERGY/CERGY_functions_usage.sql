-- Appels des fonctions

DECLARE
    v_ticket GLPI_CERGY.GLOBAL_Ticket%ROWTYPE;
BEGIN
    v_ticket := GLPI_CERGY.GET_TICKET(1);
    -- Afficher les champs du ticket rÃ©cupÃ©rÃ©
    DBMS_OUTPUT.PUT_LINE('Ticket ID: ' || v_ticket.ticket_id);
    DBMS_OUTPUT.PUT_LINE('Created By: ' || v_ticket.created_by);
    -- Afficher d'autres champs si nÃ©cessaire
END;
/

EXECUTE GLPI_CERGY.REFRESH_MATERIALIZED_VIEW('GLPI_CERGY.GLOBAL_TICKET');
EXECUTE GLPI_CERGY.SET_TICKET_STATUS(1, 'To do');
EXECUTE GLPI_CERGY.SOLVE_TICKET(1, 'Resolu avec la procedure');
EXECUTE GLPI_CERGY.CLOSE_TICKET(1);
EXECUTE GLPI_CERGY.ASSIGN_TICKET_TO_USER(3, 1);
EXECUTE GLPI_CERGY.ADD_REMOVE_OBSERVER_OF_TICKET(1 ,1);
