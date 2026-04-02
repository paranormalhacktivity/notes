# Stored Cross-Site Scripting(XSS)
Does it store? Did it scrub on the current page? Did it scrub on another page?

Basic XSS PoCs (`alert(1)`) confirm a vulnerability, but effective exploitation
often requires a payload that exfiltrates data (`document.body.innerHTML`, `document.cookie`,
etc.)

## Examples

### Markdown
[Click me for a surprise!](javascript:alert(1))

### HTML
<img src=x onerror="alert(document.body.innerHTML)">
<script>alert(1);</script>

# SQL Injection(SQLi)
Did you try all routes, show and edit?

Test all inputs, including unexpected parts of the URL path, for injection vulnerabilities.
Don't assume security is consistent across all application routes.

Mysql:
` AND (SELECT 1 FROM (SELECT(SLEEP(5)))a)`

Postgresql:
` AND pg_sleep(5)`

## Examples
`GET /page/edit/'`

# Insecure Direct Object Reference(IDOR)
Are there any pages that are hidden, due to access? Maybe try the edit page for that object?
This may result in access bypass

Always test all functionalities (view, edit, delete) for access control flaws. Don't
assume standard URL patterns; map the application thoroughly.
