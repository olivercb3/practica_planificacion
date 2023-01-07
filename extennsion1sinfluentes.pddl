(define (domain Extension1sinflu)

    (:requirements :strips :adl :typing)

    (:types lugar pedido rover - object slot base - lugar ped_suministro ped_persona - pedido)

    (:predicates    (estacionado ?rov - rover ?b - base)
                    (pedido_loc ?p - pedido ?l - lugar)
                    (pendiente ?p - pedido)
                    (pedido_dest ?p - pedido ?l - lugar)
                    (vecino ?b1 - base  ?b2 - base)
                    (lleva_persona ?rov - rover)
                    (vacio ?s - slot)
                    (dentro ?s - slot ?rov - rover)
    )

    (:action cargar_pedido_persona
     :parameters (?rov - rover ?b - base ?pp - ped_persona ?s ?s1 - slot)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?pp ?b) (pendiente ?pp) (dentro ?s ?rov) (vacio ?s) (dentro ?s1 ?rov) (vacio ?s1))
     :effect (and (pedido_loc ?pp ?s) (not(pedido_loc ?pp ?b)) (not (vacio ?s1)) (not(vacio ?s)) (lleva_persona ?rov))
    )

    (:action cargar_pedido_suministro
     :parameters (?rov - rover ?b - base ?ps - ped_suministro ?s - slot)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?ps ?b) (pendiente ?ps) (dentro ?s ?rov) (vacio ?s) (not(lleva_persona ?rov)))
     :effect (and (pedido_loc ?ps ?s) (not(pedido_loc ?ps ?b)) (not(vacio ?s)))
    )

    ;te el problema de quan descarregues un suministre no saps si en queda un altre dins del rover, i per tant no pots posar lleva_suministro a false
    (:action descargar_pedido
     :parameters (?rov - rover ?b - base ?p - pedido ?s ?s1 - slot)
     :precondition (and (pedido_loc ?p ?s) (pedido_dest ?p ?b) (estacionado ?rov ?b) (dentro ?s ?rov) (dentro ?s1 ?rov))
     :effect (and (pedido_loc ?p ?b) (not(pedido_loc ?p ?s)) (not(pendiente ?p))  (vacio ?s) (when (lleva_persona ?rov) (and(not(lleva_persona ?rov))(vacio ?s1))))
    )

    (:action mover_rover
     :parameters (?rov - rover ?b1 - base ?b2 - base)
     :precondition (and (estacionado ?rov ?b1) (vecino ?b1 ?b2))
     :effect (and (estacionado ?rov ?b2) (not(estacionado ?rov ?b1)))
    )
)