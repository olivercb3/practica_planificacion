(define (problem extension2problem_minimizar)
  (:domain extension2_minimizar)
(:objects
    ROV1 ROV2 - rover
    B1 B2 B3 B4 B5 - base
    p1 p2 - ped_persona
    p3 p4 - ped_suministro
)
(:init

    (= (carga ROV1) 0) (= (carga ROV2) 0)

    (= (gasolina ROV1) 7) (= (gasolina ROV2) 7)

    (= (gasolina-gastada) 0)

    (estacionado ROV1 B1) (estacionado ROV2 B3) 

    (pendiente p1) (pendiente p2) (pendiente p3) (pendiente p4)

    (pedido_loc p1 B1) (pedido_loc p2 B2) (pedido_loc p3 B1) (pedido_loc p4 B1)

    (pedido_dest p1 B3) (pedido_dest p2 B3) (pedido_dest p3 B3) (pedido_dest p4 B3)

    (vecino B1 B2) (vecino B2 B1) (vecino B2 B3) (vecino B3 B2) 
    (vecino B1 B4) (vecino B4 B1) (vecino B4 B5) (vecino B5 B4) (vecino B5 B3) (vecino B3 B1)
)

(:metric minimize (gasolina-gastada))

(:goal (forall (?p - pedido) (not(pendiente ?p))))
)