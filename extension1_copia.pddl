(define (domain Extension1_copia)

    (:requirements :strips :adl :typing :equality)

    (:types lugar pedido rover - object
            slot base - lugar 
            entrega peticion - pedido
            persona suministro - entrega
            ped_suministro ped_persona -peticion
    )

    (:predicates    (estacionado ?rov - rover ?b - base)
                    (pedido_loc ?p - entrega ?l - lugar)
                    (pendiente ?p - pedido)
                    (pedido_dest ?p - peticion ?l - lugar)
                    (vecino ?b1 - base  ?b2 - base)
                    (lleva_suministro ?rov - rover)
                    (vacio ?s - slot)
                    (dentro ?s - slot ?rov - rover)
                    (satisface ?e -entrega ?p -peticion )
    )

    (:action cargar_pedido_suministro
     :parameters (?rov - rover ?b - base ?ps - ped_suministro ?s - slot ?s1 - slot ?sum -suministro)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?sum ?b) (pendiente ?ps) (pendiente ?sum) (dentro ?s ?rov) (vacio ?s) (dentro ?s1 ?rov) (vacio ?s1) (not (= ?s ?s1)))
     :effect (and (pedido_loc ?sum ?s) (not(pedido_loc ?sum ?b)) (not (vacio ?s1)) (not(vacio ?s)) (lleva_suministro ?rov) (not(pendiente ?ps))
                  (satisface ?sum ?ps))
    )

    (:action cargar_pedido_persona
     :parameters (?rov - rover ?b - base ?pp - ped_persona ?s - slot ?p -persona)
     :precondition (and (estacionado ?rov ?b) (pedido_loc ?p ?b) (pendiente ?pp) (pendiente ?p) (dentro ?s ?rov) (vacio ?s) (not(lleva_suministro ?rov)))
     :effect (and (pedido_loc ?p ?s) (not(pedido_loc ?p ?b)) (not(vacio ?s)) (not(pendiente ?pp))
                  (satisface ?p ?pp))
    )

    (:action descargar_pedido
     :parameters (?rov - rover ?b - base ?p - peticion ?s - slot ?s1 - slot ?e - entrega) 
     :precondition (and (pedido_loc ?e ?s) (pedido_dest ?p ?b) (estacionado ?rov ?b) (dentro ?s ?rov) (dentro ?s1 ?rov) (not (= ?s ?s1)) (satisface ?e ?p))
     :effect (and (pedido_loc ?e ?b) (not(pedido_loc ?e ?s)) (not(pendiente ?e))  (vacio ?s) 
             (when (lleva_suministro ?rov) (and(not(lleva_suministro ?rov))(vacio ?s1))))
    )

    (:action mover_rover
     :parameters (?rov - rover ?b1 - base ?b2 - base)
     :precondition (and (estacionado ?rov ?b1) (vecino ?b1 ?b2))
     :effect (and (estacionado ?rov ?b2) (not(estacionado ?rov ?b1)))
    )
)