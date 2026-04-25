;; extends

;; Force C++ specifier/modifier keywords to use @keyword.modifier with a higher
;; priority than the default @keyword capture, so the colorscheme can target
;; them distinctly (otherwise both captures match at priority 100 and the
;; generic @keyword wins).
[
  "constexpr"
  "consteval"
  "constinit"
  "static"
  "extern"
  "thread_local"
  "register"
  "inline"
  "virtual"
  "explicit"
  "mutable"
  "friend"
  "noexcept"
  "override"
  "final"
] @keyword.modifier (#set! "priority" 200)
