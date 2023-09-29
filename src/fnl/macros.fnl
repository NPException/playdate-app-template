(fn import [lib]
  `(lua ,(.. "import \"" lib "\"")))

(fn const [name x]
  `(lua ,(.. "local " (tostring name) " <const> = " (tostring x))))

; TODO: try to find out if you can automatically add in the name of the calling file/module
(fn generated-header []
  `(lua ,(.. "-----------------------------------------------------\n"
             "-- this file is generated. do not modify manually. --\n"
             "-----------------------------------------------------\n")))

(fn set+ [local-var arg]
  `(set ,local-var (+ ,local-var ,arg)))

(fn set- [local-var arg]
  `(set ,local-var (- ,local-var ,arg)))

(fn set* [local-var arg]
  `(set ,local-var (* ,local-var ,arg)))

(fn set-div [local-var arg]
  `(set ,local-var (/ ,local-var ,arg)))

{: import
 : const
 : generated-header
 : set+ : set- : set* : set-div}
