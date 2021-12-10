(defun listsum (hs) "Sum the elements of a list"
       (if (null hs)
	   0
	 (+ (car hs) (listsum (cdr hs))))
       )

(defun abs (x) "Returns the absolute value of x"
       (if (> x 0) x (* -1 x)))

(defun solution (hs)
  "Solution to https://app.codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/"
  (let (
	(sumRight (listsum hs))
	(sumLeft 0)
	result
	)
    (dolist (current hs result)
      (progn
       (setq sumRight (- sumRight current)
	     sumLeft (+ sumLeft current)
	     candidateResult (abs (- sumRight sumLeft))
	     )
       (if (or
	    (null result)
	    (< candidateResult result))
	   (progn
	     (setq result candidateResult)
	     (message "Result set to %d" result))
	 )
       )
      )
    )
  )

(solution '(3 1 2 4 3))
