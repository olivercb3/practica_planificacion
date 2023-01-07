(define (problem extension2problem)
  (:domain extension2)
(:objects
    ROV1 ROV2 - rover
    r11 r12 r21 r22 - slot
    B1 B2 B3 - base
    p1 p2 - ped_persona
    p3 p4 - ped_suministro
)
(:init

    (= (gasolina ROV1) 10) (= (gasolina ROV2) 10)
    
    (dentro r11 ROV1) (dentro r12 ROV1)  (dentro r21 ROV2)  (dentro r22 ROV2)  

    (vacio r11) (vacio r12) (vacio r21) (vacio r22)

    (estacionado ROV1 B1) (estacionado ROV2 B3) 

    (pendiente p1) (pendiente p2) (pendiente p3) (pendiente p4)

    (pedido_loc p1 B1) (pedido_loc p2 B2) (pedido_loc p3 B1) (pedido_loc p4 B1)

    (pedido_dest p1 B3) (pedido_dest p2 B3) (pedido_dest p3 B3) (pedido_dest p4 B3)

    (vecino B1 B2) (vecino B2 B1) (vecino B2 B3) (vecino B3 B2)
)

(:goal (forall (?p - pedido) (not(pendiente ?p))))
)