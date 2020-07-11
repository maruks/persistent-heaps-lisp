(defpackage #:leftist-heap
  (:use #:cl)
  (:export #:heap-sort #:heap->list #:list->heap))

(in-package #:leftist-heap)

(defstruct (node (:conc-name nil)) elem rank left right)

(defun ->rank (node)
  (if node (rank node) 0))

(defun ->node (e node-1 node-2)
  (if (>= (->rank node-1) (->rank node-2))
    (make-node :rank (1+ (->rank node-2)) :elem e :left node-1 :right node-2)
    (make-node :rank (1+ (->rank node-1)) :elem e :left node-2 :right node-1)))

(defun heap-merge (node-1 node-2)
  (cond ((null node-1) node-2)
        ((null node-2) node-1)
        (t (let ((x (elem node-1))
		 (a1 (left node-1))
		 (b1 (right node-1))
		 (y (elem node-2))
		 (a2 (left node-2))
		 (b2 (right node-2)))
	     (if (<=  x y)
		 (->node x a1 (heap-merge b1 node-2))
		 (->node y a2 (heap-merge node-1 b2)))))))

(defun insert (node elem)
  (heap-merge (make-node :rank 1 :elem elem :left nil :right nil) node))

(defun find-min (node)
  (when node
    (elem node)))

(defun delete-min (node)
  (when node
    (heap-merge (left node) (right node))))

(defun heap->list (node)
  (when node
    (cons (find-min node) (heap->list (delete-min node)))))

(defun list->heap (xs)
  (reduce #'insert xs :initial-value nil))

(defun heap-sort (xs)
  (when xs
    (heap->list (list->heap xs))))
