(define (domain MarteDominio)

    (:requirements :strips :adl :typing)

    (:types lugar pedido - object
            rover base - lugar
            ped_suministro ped_persona entrega - pedido
            persona suministro - entrega
    )

    (:predicates    (estacionado ?rov - rover ?b - base)
                    (pedido_loc ?p - entrega ?l - lugar)
                    (pendiente ?p - pedido)
                    (pedido_dest ?p - pedido ?l - lugar)
                    (vecino ?b1 - base  ?b2 - base)
                    (satisface ?e -entrega ?p -pedido )
    )

    (:action cargar_pedido_persona
     :parameters (?rov - rover ?b - base ?pp - ped_persona ?p - persona)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?p ?b) (pendiente ?pp) (pendiente ?p))
     :effect (and (pedido_loc ?p ?rov) (not(pedido_loc ?p ?b)) (not(pendiente ?pp)) (satisface ?p ?pp) )
    )
    
    (:action cargar_pedido_suministro
     :parameters (?rov - rover ?b - base ?ps - ped_suministro ?sum - suministro)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?sum ?b) (pendiente ?ps) (pendiente ?sum))
     :effect (and (pedido_loc ?sum ?rov) (not(pedido_loc ?sum ?b)) (not(pendiente ?ps)) (satisface ?sum ?ps) )
    )

    (:action descargar_pedido
     :parameters (?rov - rover ?b - base ?p - pedido ?e - entrega)
     :precondition (and (pedido_loc ?e ?rov) (pedido_dest ?p ?b) (estacionado ?rov ?b) (satisface ?e ?p))
     :effect (and (pedido_loc ?e ?b) (not(pedido_loc ?e ?rov)) (not(pendiente ?e)))
    )

    (:action mover_rover
     :parameters (?rov - rover ?b1 - base ?b2 - base)
     :precondition (and (estacionado ?rov ?b1) (vecino ?b1 ?b2))
     :effect (and (estacionado ?rov ?b2) (not(estacionado ?rov ?b1)))
    )
)