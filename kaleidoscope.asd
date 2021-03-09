;;; NOTE: In order to load and run the Kaleidoscope tutorial, you first need to
;;;       run `./build-library.sh` in the tutorial subdirectory.

(defsystem kaleidoscope
    :description "A translation of the language created in the LLVM tutorial."
    :depends-on (llvm)
    :pathname "tutorial/"
    :components ((:file "cffi")
                 (:file "chapter2")
                 (:file "chapter3")
                 (:file "chapter4")
                 (:file "chapter5")
                 (:file "chapter6")
                 (:file "chapter7")))
