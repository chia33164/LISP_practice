;;; file: problem1_3.lsp

(defun fib1 (n)
    (if (< n 2)
        (return-from fib1 n)
        (return-from fib1 (+ (fib1 (- n 1)) (fib1 (- n 2))))
    )
)

(defun tailfib (n a b)
    (if (= n 0)
        a
        (tailfib (- n 1) b (+ a b))
    )
)

(defun fib2 (n)
    (return-from fib2 (tailfib n 0 1))
)

(trace fib1)
(trace fib2)
(fib1 3)
(fib2 8)
