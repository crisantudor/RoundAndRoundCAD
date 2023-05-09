(defun rnd (/ modulus multiplier increment random)
  (if (not seed)
    (setq seed (getvar "DATE"))
  )
  (setq modulus    65536
        multiplier 25173
        increment  13849
        seed  (rem (+ (* multiplier seed) increment) modulus)
        random     (/ seed modulus)
  )
)

(defun c:drawcircles (/ ss)
  ; Add code to generate 20 random circles near the origin with random radius
  (setq origin (list 0.0 0.0 0.0))
  (repeat 500
    (setq r (fix(* 200 (rnd))))
    (setq x (fix(* 10000 (rnd))))
    (setq y (fix(* 10000 (rnd))))
    (setq center (list x y 0.0))
    (command "_circle" center r "")
  )
)