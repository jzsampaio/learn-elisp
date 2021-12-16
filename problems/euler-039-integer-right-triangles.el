;; If p is the perimeter of a right angle triangle with integral length
;; sides, {a,b,c}, there are exactly three solutions for p = 120.
;; {20,48,52}, {24,45,51}, {30,40,50} For which value of p ≤ 1000, is
;; the number of solutions maximised?
;; libraries to check: s, dash (functions are called -something), ht, seq, pcase-lambda, elisp-match

(require 's)

(require 'dash)
(require 'seq)
(require 'ht)

(defun isRightTriangle (a b c)
  "Function that checks if (a, b, c) form a right angle rectangle"
  (equal
   (expt c 2)
   (+ (expt a 2) (expt b 2)))
  )
(isRightTriangle 3 4 5)
(isRightTriangle 3 4 0)

(setq xs ())

(defun solutionLoop (maxP)
  (progn
    (setq maxFound 0
	  maximizer 0)
    (cl-loop for p from 1 to maxP do
	     (progn
	       (setq currentCount 0)
	       (cl-loop for a from 1 below p do
			(cl-loop for b from 1 below (- p a) do
				 (let ((c (- p a b))) 
				   (if (isRightTriangle a b c)
				       (setq currentCount (+ currentCount 1)))
							
				      )
				 )
			)
	       (if (> currentCount maxFound)
		   (progn
		     (setq maxFound currentCount
			   maximizer p)))
	   )
     )
  ))

(progn 
 (solutionLoop 1000)
 (message "Ans: %d" maximizer)
 )
