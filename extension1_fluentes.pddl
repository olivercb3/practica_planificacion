(define (domain extension1_fluentes)

    (:requirements :strips :adl :typing :fluents)

    (:types lugar pedido - object 
            rover base - lugar 
            ped_suministro ped_persona - pedido)

    (:predicates    (estacionado ?rov - rover ?b - base)
                    (pedido_loc ?p - pedido ?l - lugar)
                    (pendiente ?p - pedido)
                    (pedido_dest ?p - pedido ?l - lugar)
                    (vecino ?b1 - base  ?b2 - base)
                    (lleva_persona ?rov - rover)
                    (lleva_suministro ?rov - rover)
    )

    (:functions
    (carga ?rov -rover)
  )

    (:action cargar_pedido_persona
     :parameters (?rov - rover ?b - base ?pp - ped_persona)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?pp ?b) (pendiente ?pp) (<= (carga ?rov) 1) (not(lleva_suministro ?rov)))
     :effect (and (pedido_loc ?pp ?rov) (not(pedido_loc ?pp ?b)) (lleva_persona ?rov) (increase (carga ?rov) 1))
    )

    (:action cargar_pedido_suministro
     :parameters (?rov - rover ?b - base ?ps - ped_suministro)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?ps ?b) (pendiente ?ps)  (= (carga ?rov) 0) (not(lleva_persona ?rov)))
     :effect (and (pedido_loc ?ps ?rov) (not(pedido_loc ?ps ?b)) (lleva_suministro ?rov) (increase (carga ?rov) 1))
    )

    (:action descargar_pedido
     :parameters (?rov - rover ?b - base ?p - pedido)
     :precondition (and (pedido_loc ?p ?rov) (pedido_dest ?p ?b) (estacionado ?rov ?b))
     :effect (and   (pedido_loc ?p ?b) (not(pedido_loc ?p ?rov)) (not(pendiente ?p))
                    (decrease (carga ?rov) 1) 
                    (when (lleva_suministro ?rov) (not(lleva_suministro ?rov)))    
                    (when (and (lleva_persona ?rov) (= (carga ?rov) 0)) (not(lleva_persona ?rov)))
            )
    )

    (:action mover_rover
     :parameters (?rov - rover ?b1 - base ?b2 - base)
     :precondition (and (estacionado ?rov ?b1) (vecino ?b1 ?b2))
     :effect (and (estacionado ?rov ?b2) (not(estacionado ?rov ?b1)))
    )
)