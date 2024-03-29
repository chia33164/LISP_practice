;;; file: problem1_1.lsp

(defun prime (number)
    (let ((x 1))
        (do ((i 2 (+ i 1)))
            ((>= i  number))
            (if (= 0 (mod number i))
                (setf x 2)
            )
        )
        (if (= x 1)
            (format t "~A is prime\ ~%" number)
            (format t "~A is not prime\ ~%" number)
        )
    )
)

(prime 2)
(prime 239)
(prime 999)
(prime 17)