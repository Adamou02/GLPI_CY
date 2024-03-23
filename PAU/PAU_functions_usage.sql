-- Appels des fonctions

DECLARE
    v_ticket GLPI_PAU.GLOBAL_Ticket%ROWTYPE;
BEGIN
    v_ticket := GLPI_PAU.GET_TICKET(1);
    -- Afficher les champs du ticket récupéré
    DBMS_OUTPUT.PUT_LINE('Ticket ID: ' || v_ticket.ticket_id);
    DBMS_OUTPUT.PUT_LINE('Created By: ' || v_ticket.created_by);
    -- Afficher d'autres champs si nécessaire
END;
/
EXECUTE GLPI_PAU.GET_TICKET_COMMENTS(1);

EXECUTE GLPI_PAU.REFRESH_MATERIALIZED_VIEW('GLPI_PAU.GLOBAL_TICKET');
EXECUTE GLPI_PAU.SET_TICKET_STATUS(1, 'To do');
EXECUTE GLPI_PAU.SOLVE_TICKET(1, 'Resolu avec la procedure');
EXECUTE GLPI_PAU.CLOSE_TICKET(1);
EXECUTE GLPI_PAU.ASSIGN_TICKET_TO_USER(2, 4);
EXECUTE GLPI_PAU.ADD_REMOVE_OBSERVER_OF_TICKET(1 ,1);