(defpackage :heaps-tests
  (:use :cl :cacau :check-it :assert-p :leftist-heap))

(in-package :heaps-tests)

(deftest "heap-sort-test-1"
    (equalp
     (-10 -10 -9 -9 -8 -8 -7 -6 -6 -3 -2 -1 -1 0 0 0 1 3 4 4 4 4 5 6 8 9 10 10)
     (heap-sort '(-10 -7 -3 4 6 4 -2 -6 -10 3 5 9 8 0 -1 -1 -9 -6 4 10 4 1 -9 0 0 -8 10 -8) )))

(deftest "heap-sort-test-2" ()
  (let ((*num-trials* 1000)
	(*list-size* 1000))
    (t-p (check-it (generator (list (integer)))
		   (lambda (xs)
		     (equalp-p (heap-sort xs) (sort xs #'<)))))))
