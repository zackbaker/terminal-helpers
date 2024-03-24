; extends
(
    (string) @sql
    (#match? @sql ".*(ALTER|CREATE|DELETE|DROP|GRANT|INSERT|SELECT|TRUNCATE|UNLOAD|UPDATE).*$") 
    (#offset! @sql 0 1 0 -1)
    (#set! Injection.language "sql")
)
