(define (domain Extension1)

    (:requirements :strips :adl :typing :equality)

    (:types lugar pedido rover - object
            slot base - lugar 
            entrega peticiones - pedido
            persona suministro - entrega
            ped_suministro ped_persona -peticiones
    )

    (:predicates    (estacionado ?rov - rover ?b - base)
                    (pedido_loc ?p - entrega ?l - lugar)
                    (pendiente ?p - pedido)
                    (pedido_dest ?p - peticiones ?l - lugar)
                    (vecino ?b1 - base  ?b2 - base)
                    (lleva_suministro ?rov - rover)
                    (vacio ?s - slot)
                    (dentro ?s - slot ?rov - rover)
    )

    (:action cargar_pedido_suministro
     :parameters (?rov - rover ?b - base ?ps - ped_suministro ?s - slot ?s1 - slot)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?ps ?b) (pendiente ?ps) (dentro ?s ?rov) (vacio ?s) (dentro ?s1 ?rov) (vacio ?s1) (not (= ?s ?s1)))
     :effect (and (pedido_loc ?ps ?s) (not(pedido_loc ?ps ?b)) (not (vacio ?s1)) (not(vacio ?s)) (lleva_suministro ?rov))
    )

    (:action cargar_pedido_persona
     :parameters (?rov - rover ?b - base ?pp - ped_persona ?s - slot)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?pp ?b) (pendiente ?pp) (dentro ?s ?rov) (vacio ?s) (not(lleva_suministro ?rov)))
     :effect (and (pedido_loc ?pp ?s) (not(pedido_loc ?pp ?b)) (not(vacio ?s)))
    )

    (:action descargar_pedido
     :parameters (?rov - rover ?b - base ?p - pedido ?s - slot ?s1 - slot)
     :precondition (and (pedido_loc ?p ?s) (pedido_dest ?p ?b) (estacionado ?rov ?b) (dentro ?s ?rov) (dentro ?s1 ?rov) (not (= ?s ?s1)))
     :effect (and (pedido_loc ?p ?b) (not(pedido_loc ?p ?s)) (not(pendiente ?p))  (vacio ?s) 
             (when (lleva_suministro ?rov) (and(not(lleva_suministro ?rov))(vacio ?s1))))
    )

    (:action mover_rover
     :parameters (?rov - rover ?b1 - base ?b2 - base)
     :precondition (and (estacionado ?rov ?b1) (vecino ?b1 ?b2))
     :effect (and (estacionado ?rov ?b2) (not(estacionado ?rov ?b1)))
    )
)