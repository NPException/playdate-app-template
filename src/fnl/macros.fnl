(fn import [lib]
  `(lua ,(.. "import \"" lib "\"")))

(fn const [name x]
  `(lua ,(.. "local " (tostring name) " <const> = " (tostring x))))

; TODO: try to find out if you can automatically add in the name of the calling file/module
(fn generated-header []
  `(lua ,(.. "-----------------------------------------------------\n"
             "-- this file is generated. do not modify manually. --\n"
             "-----------------------------------------------------\n")))

; TODO: add macros for more Playdate Lua extensions, like +=, -=, etc.

{: import
 : const
 : generated-header}
