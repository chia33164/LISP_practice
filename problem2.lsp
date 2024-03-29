;;; file: problem2.lsp
(defun my_merge (left right length)
    (let ((result nil))
        (do ((i 0 (+ i 1)))
            ((>= i length) (setf result(reverse result)) (return-from my_merge result))
            (cond ((endp left) (progn (setf result (cons (car right) result)) (setf right (cdr right))))
                    ((endp right) (progn (setf result (cons (car left) result)) (setf left (cdr left))))
                    (t (if (<= (car left) (car right))
                        (progn
                            (setf result (cons (car left) result))
                            (setf left (cdr left))
                        )
                        (progn
                            (setf result (cons (car right) result))
                            (setf right (cdr right))
                        )
                    ))
            )
        )
    )
)


(defun mergesort (numbers)
    (if (<= (length numbers) 1)
        (return-from mergesort numbers)
        (let ((half (truncate (/ (length numbers) 2))))
            (return-from mergesort (my_merge (mergesort (subseq numbers 0 half)) (mergesort (subseq numbers half)) (length numbers) ))  
        )
    )
)
; main function
(let ((n (read))
(numbers))
(setf numbers
(do ((i 0 (+ i 1))
(tmp nil))
((>= i n)
(reverse tmp))
(setf tmp (cons (read) tmp))))
(format t "~{~A ~}~%" (mergesort numbers)))