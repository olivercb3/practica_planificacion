(define (domain Marte)

    (:requirements :strips :adl : typing)

    (:types lugar pedido - object rover base - lugar)

    (:predicates    (estacionado ?rov - rover ?b - base)
                    (pedido_loc ?ped - pedido ?l - lugar)
                    (pendiente(?p - pedido)
                    (pedido_dest ?ped - pedido ?l - lugar)
                    (vecino ?b1 base - ?b2 - base)
    )

    (:action cargar_pedido
     :parameters (?rov - rover ?b - base ?p - pedido)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?p ?b) (pendiente ?p))
     :effect (and (pedido_loc ?ped ?rov) (not(pedido_loc ?p ?b)))
    )

    (:action descargar_pedido
     :parameters (?rov - rover ?b - base ?p - pedido)
     :precondition (and (estacionado ?rov ?b) (pedido_dest ?p ?b))
     :effect (and (pedido_loc ?ped ?rov) (not(pedido_loc ?p ?b)) (not(pendiente ?p)))
    )

    (:action mover_rover
     :parameters (?rov - rover ?b1 - base ?b2 - base)
     :precondition (and (estacionado ?rov ?b1) (vecino ?b1 ?b2))
     :effect (and (pedido_loc ?ped ?rov) (not(pedido_loc ?p ?b)))
    )
)