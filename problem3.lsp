;;; file: problem3.lsp


(defun readfile (path my_list)
    (let ((in (open path :if-does-not-exist nil)) (my_list nil))
        (when in
            (loop for line = (read-line in nil)
                while line do (setf my_list (cons line my_list)))
            (close in))
        (setf my_list (reverse my_list))
        (return-from readfile my_list)
    )
)

(defun lcs (file1 file2)
    (cond
        ((or (endp file1) (endp file2)) nil)
        ((equal (car file1) (car file2))
            (cons (car file1) (lcs (cdr file1) (cdr file2))))
        (t  (if (> (length (lcs file1 (cdr file2))) (length (lcs (cdr file1) file2)))
                (lcs file1 (cdr file2))
                (lcs (cdr file1) file2)
            )
        )
    )
)

(defun diff (file1 file2 lcs)
    (do ((j 0 (+ j 1)))
        ((and (endp file1) (endp file2)) nil)
        (progn
            (do ((i 0 (+ i 1)))
                ((or (equal (car file1) (car lcs)) (endp file1))
                    (setf file1 (cdr file1))
                )
                (progn
                    (format t "~c[31m-~a~c[0m~%" #\ESC (car file1) #\ESC)
                    (setf file1 (cdr file1))
                )
            )
            (do ((i 0 (+ i 1)))
                ((or (equal (car file2) (car lcs)) (endp file2))
                    (progn
                        (setf file2 (cdr file2))
                        (format t " ~a~%" (car lcs))
                        (setf lcs (cdr lcs))
                    )
                )
                (progn
                    (format t "~c[32m+~a~c[0m~%" #\ESC (car file2) #\ESC)
                    (setf file2 (cdr file2))
                )
            )
        )
    )
)

(let ( (file1 (readfile "input/file1.txt" nil)) (file2 (readfile "input/file2.txt" nil)) )
    (diff file1 file2 (lcs file1 file2))
)