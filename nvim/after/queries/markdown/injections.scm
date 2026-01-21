; extends

; inject tsx for import/export statements
((inline) @injection.content
  (#lua-match? @injection.content "^%s*import")
  (#set! injection.language "tsx"))

((inline) @injection.content
  (#lua-match? @injection.content "^%s*export")
  (#set! injection.language "tsx"))

; inject tsx for JSX blocks (lines starting with <)
((inline) @injection.content
  (#lua-match? @injection.content "^%s*<")
  (#set! injection.language "tsx"))
