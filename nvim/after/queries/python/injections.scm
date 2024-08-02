; extends
(
    (string (string_content) @injection.content)
    (#match? @injection.content ".*(ALTER|CREATE|DELETE|DROP|GRANT|INSERT|SELECT|TRUNCATE|UNLOAD|UPDATE).*$")
    (#set! injection.language "sql")
)

