(define (problem Extension1prob)
  (:domain Extension1)
(:objects
    ROV1 ROV2 ROV3 ROV4 - rover
    r11 r12 r21 r22 r31 r32 r41 r42 - slot
    B1 B2 B3 B4 B5 B6 B7 B8 B9 B10 - base
    p1 p2 p3 p4 p5 p6 p7 p8 - ped_suministro
    p9 p10 p11 p12 p13 p14 p15 - ped_persona
)
(:init
    (estacionado ROV1 B4) (estacionado ROV2 B1) (estacionado ROV3 B10) (estacionado ROV4 B6)

    (dentro r11 ROV1) (dentro r12 ROV1)  (dentro r21 ROV2)  (dentro r22 ROV2)  
    (dentro r31 ROV3)  (dentro r32 ROV3)  (dentro r41 ROV4)  (dentro r42 ROV4)  

    (vacio r11) (vacio r12) (vacio r21) (vacio r22) (vacio r31) (vacio r32) (vacio r41) (vacio r42)

    (pendiente p1) (pendiente p2) (pendiente p3) (pendiente p4) (pendiente p5) (pendiente p6) 
    (pendiente p7) (pendiente p8) (pendiente p9) (pendiente p10) (pendiente p11) (pendiente p12)
    (pendiente p13) (pendiente p14) (pendiente p15) 

    (pedido_loc p1 B3) (pedido_loc p2 B3) (pedido_loc p3 B3) (pedido_loc p4 B3) (pedido_loc p5 B3)
    (pedido_loc p6 B2) (pedido_loc p7 B2) (pedido_loc p8 B2) (pedido_loc p9 B2) (pedido_loc p10 B2)
    (pedido_loc p11 B7) (pedido_loc p12 B7) (pedido_loc p13 B7) (pedido_loc p14 B7) (pedido_loc p15 B7)

    (pedido_dest p1 B1) (pedido_dest p2 B5) (pedido_dest p3 B9) (pedido_dest p4 B9) (pedido_dest p5 B6)
    (pedido_dest p6 B10) (pedido_dest p7 B10) (pedido_dest p8 B4) (pedido_dest p9 B5) (pedido_dest p10 B6)
    (pedido_dest p11 B8) (pedido_dest p12 B9) (pedido_dest p13 B1) (pedido_dest p14 B4) (pedido_dest p15 B1)

    (vecino B1 B2) (vecino B2 B1) (vecino B1 B3) (vecino B3 B1) (vecino B1 B4) (vecino B4 B1) 
    (vecino B1 B2) (vecino B2 B1) (vecino B3 B4) (vecino B4 B3) (vecino B4 B5) (vecino B5 B4)
    (vecino B3 B10) (vecino B10 B3) (vecino B3 B8) (vecino B8 B3) (vecino B8 B10) (vecino B10 B8)   
    (vecino B8 B9) (vecino B9 B8) (vecino B8 B6) (vecino B6 B8) (vecino B6 B7) (vecino B7 B6)   
)

(:goal (forall (?p - pedido) (not(pendiente ?p))))
)