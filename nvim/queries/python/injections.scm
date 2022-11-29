(
    ;; (string) @sql (#match? @sql "ALTER|BEGIN|CALL|COMMENT|COMMIT|CONNECT|CREATE|DELETE|DROP|END|EXPLAIN|EXPORT|GRANT|IMPORT|INSERT|LOAD|LOCK|MERGE|REFRESH|RENAME|REPLACE|REVOKE|ROLLBACK|SELECT|SET|TRUNCATE|UNLOAD|UNSET|UPDATE|UPSERT|alter|begin|call|comment|commit|connect|create|delete|drop|end|explain|export|grant|import|insert|load|lock|merge|refresh|rename|replace|revoke|rollback|select|set|truncate|unload|unset|update|upsert") 
    (string) @sql (#match? @sql "ALTER|CREATE|DELETE|DROP|GRANT|INSERT|SELECT|TRUNCATE|UNLOAD|UPDATE|alter|create|delete|drop|grant|insert|select|truncate|unload|update") 
)
