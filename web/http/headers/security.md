# Security Headers

## Overview
Security headers were designed to enhance security against web
based attacks. They are a class of response headers used to
specify certain rules and policies to be followed by the browser.

## Examples
```
------------------------------------------------------------------------------------
| Header     | Example               | Description                                 |
------------------------------------------------------------------------------------
| Content-   | Content-Security-     | Websites policy towards externally injected |
| Security-  | Policy: script-src    | resources. Tells browser to accept resources|
| Policy     | 'self'                | only from trusted domains, prevents Cross-  |
|            |                       | Site Scripting(XSS)                         |
------------------------------------------------------------------------------------
| Strict-    | Strict-Transport-     | Forces communication using HTTPS instead of |
| Transport- | Policy: max-age=1000  | HTTP. Prevents attackers from sniffing web  |
| Policy     |                       | traffic.                                    |
------------------------------------------------------------------------------------
| Referrer-  | Referrer-Policy:origin| Dictates whether the browser should include |
| Policy     |                       | Referrer header value or not. This can help |
|            |                       | in avoiding sensitive URLs and information  |
|            |                       | while browsing the site.
------------------------------------------------------------------------------------
```
