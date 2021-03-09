(defpackage llvm-system
  (:use #:cl #:asdf))

(in-package :llvm-system)

;;; NOTE: before this will work, you need to have LLVM installed (and don't
;;;       forget to build the shared lib with --enable-shared)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (mapc #+quicklisp #'ql:quickload #-quicklisp #'asdf:load-system
        '(cffi-grovel)))

(defsystem llvm
  :description "CFFI bindings to the LLVM libraries."
  :long-description "LLVM is a collection of modular and reusable compiler and
                     toolchain technologies. This library makes it easy (and
                     hopefully intuitive) to use them in Common Lisp."
  :license "MIT"
  :author "Greg Pfeil <greg@technomadic.org>"
  :depends-on (cffi cffi-grovel trivial-features cl-ppcre split-sequence trivial-shell)
  :pathname "src/"
  :components
  ((:file "package")
   (:file "cffi" :depends-on ("package"))
   (:module "core"
            :depends-on ("package" "cffi")
            :components ((cffi-grovel:grovel-file "grovel")
                         (:file "error-handling" :depends-on ("grovel"))
                         (:file "modules"
                                :depends-on ("grovel" "error-handling"))
                         (:file "types"
                                :depends-on ("grovel" "modules" "error-handling"))
                         (:file "values"
                                :depends-on ("grovel" "modules" "error-handling"))
                         (:file "instruction-builders"
                                :depends-on ("grovel" "error-handling"))
                         (:file "memory-buffers"
                                :depends-on ("grovel" "error-handling"))
                         (:file "pass-managers"
                                :depends-on ("grovel" "error-handling"))))
   (:module "" :pathname ""
            :depends-on ("package" "cffi" "core")
            :components ((cffi-grovel:grovel-file "analysis-grovel")
                         (:file "analysis" :depends-on ("analysis-grovel"))
                         (:file "bit-reader")
                         (:file "bit-writer")
                         (:file "execution-engine")
                         (cffi-grovel:grovel-file "target-grovel")
                         (:file "target" :depends-on ("target-grovel"))
                         (:file "scalar-transforms")))))

