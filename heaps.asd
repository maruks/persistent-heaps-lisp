;;;; heaps.asd

(defsystem "heaps"
  :description "Describe heaps here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :version "0.0.1"
  :serial t
  :components ((:module "src"
		:components ((:file "leftist-heap"))))
  :in-order-to ((test-op (test-op "heaps/tests"))))

(defsystem "heaps/tests"
  :license "Specify license here"
  :depends-on (:heaps
	       :cacau
	       :check-it
	       :assert-p)
  :serial t
  :components ((:module "tests"
		:components ((:file "heaps-tests"))))
  :perform (test-op (o c) (symbol-call 'cacau 'run :colorful nil :reporter :list)))
