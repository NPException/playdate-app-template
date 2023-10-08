(fn const [name x]
  `(lua ,(.. "local " (tostring name) " <const> = " (tostring x))))

(fn GENERATED_HEADER []
  `(lua ,(.. "-----------------------------------------------\n"
             "-- File is generated. Do not modify by hand. --\n"
             "-----------------------------------------------\n")))

; inserts an empty line in the generated Lua file
(fn SPACER []
  `(lua "\n"))

; inserts a comment for documentation
(fn DOC [x]
  `(lua ,(.. "--[[ " (tostring x) " ]]--")))

; macro for +=
(fn set+ [local-var arg]
  `(set ,local-var (+ ,local-var ,arg)))

; macro for -=
(fn set- [local-var arg]
  `(set ,local-var (- ,local-var ,arg)))

; macro for *=
(fn set* [local-var arg]
  `(set ,local-var (* ,local-var ,arg)))

; macro for /=
(fn set-div [local-var arg]
  `(set ,local-var (/ ,local-var ,arg)))


; Wrap a body of code in `gfx.pushContext(img) ... gfx.popContext()`
(fn with-context [gfx img ...]
  `(do ((. ,gfx "pushContext") ,img)
       (do ,...)
       ((. ,gfx "popContext"))))


{: const
 : GENERATED_HEADER : SPACER : DOC
 : set+ : set- : set* : set-div
 : with-context}
