( defun solution-euler-9 (M)
  "Solves Euler Problem 9 - Special Pythagorean Triplet (https://projecteuler.net/problem=9)"
  (
   let (x)
    (dolist
	(c (number-sequence 1 M) x)
      (dolist
	  (b (number-sequence 1 c))
	(dolist
	    (a (number-sequence 1 b))
	  (if (and
	       (equal (+ (* a a) (* b b)) (* c c))
	       (equal (+ a b c) M))
	      (setq x (list a b c)))
	  )
	)
      )
    )
  )

(solution-euler-9 1000)
; result is (200 375 425). Also, the provided solution is O(n^3) in
; time, and N = 1000, thus it takes quite a while to run. However, the
; solution is O(1) in memory. Wait about 2 minutes and the solution
; will appear on the mini buffer. Check the buffer ~*Messages*~ in
; case the response disapear before you see it.
