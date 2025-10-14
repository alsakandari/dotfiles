; Function and Method calls

(call (member key: (identifier) @function.method))
(call (identifier) @function)

; Parameters

(parameters (identifier) @variable.parameter)

; Variables

(member key: (identifier) @variable.other.member)
(identifier) @variable

; Literals

(none) @constant.builtin

[(true) (false)] @constant.builtin.boolean

(int) @constant.numeric.integer
(float) @constant.numeric.float

(string) @string

; Comments

(comment) @comment

; Keywords

"fn" @keyword.function

"return" @keyword.control.return

"while" @keyword.control.repeat

[
 "if"
 "else"
] @keyword.control.conditional

[
 (break)
 (continue)
] @keyword.control

; Operators

[
  "+"
  "-"
  "/"
  "*"
  "**"
  "%"
  "<"
  ">"
  "=="
  "="
  "+="
  "-="
  "/="
  "*="
  "**"
  "%="
] @operator

; Punctuation

[
  ":"
  ","
  "."
] @punctuation.delimiter

[
 "("
 ")"
 "["
 "]"
 "{"
 "}"
] @punctuation.bracket

