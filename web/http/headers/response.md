# Response Headers

## Overview
Response headers are used exclusively in HTTP responses. Certain response headers do
provide more context about the response.

## Examples
------------------------------------------------------------------------------------
| Header     | Example               | Description                                 |
------------------------------------------------------------------------------------
| Server     | Server: Apache/2.2.14 | Contains information about the HTTP server  |
------------------------------------------------------------------------------------
| Set-Cookie | Set-Cookie:           | Contains cookies needed for client          |
|            | PHPSESSID=ji54sdv37v  | identification. Browser parses cookies and  |
|            |                       | stores them for later. Follows same format  |
|            |                       | as request header.                          |
------------------------------------------------------------------------------------
| WWW-       | WWW-Authenticate:     | Notifies the client about the type of       |
| Auth...    | BASIC realm="localhost| authentication required for resource        |
------------------------------------------------------------------------------------
