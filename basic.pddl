(define (domain MarteDominio)

    (:requirements :strips :adl :typing)

    (:types lugar pedido - object rover base - lugar)

    (:predicates    (estacionado ?rov - rover ?b - base)
                    (pedido_loc ?p - pedido ?l - lugar)
                    (pendiente ?p - pedido)
                    (pedido_dest ?p - pedido ?l - lugar)
                    (vecino ?b1 - base  ?b2 - base)
    )

    (:action cargar_pedido
     :parameters (?rov - rover ?b - base ?p - pedido)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?p ?b) (pendiente ?p))
     :effect (and (pedido_loc ?p ?rov) (not(pedido_loc ?p ?b)))
    )

    (:action descargar_pedido
     :parameters (?rov - rover ?b - base ?p - pedido)
     :precondition (and (pedido_loc ?p ?rov) (pedido_dest ?p ?b) (estacionado ?rov ?b))
     :effect (and (pedido_loc ?p ?b) (not(pedido_loc ?p ?rov)) (not(pendiente ?p)))
    )

    (:action mover_rover
     :parameters (?rov - rover ?b1 - base ?b2 - base)
     :precondition (and (estacionado ?rov ?b1) (vecino ?b1 ?b2))
     :effect (and (estacionado ?rov ?b2) (not(estacionado ?rov ?b1)))
    )
)