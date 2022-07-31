# Request Headers

## Overview
Request headers are used exclusively in HTTP requests. They do not relate to the
content of the message.

## Examples
------------------------------------------------------------------------------------
| Header     | Example               | Description                                 |
------------------------------------------------------------------------------------
| Host       | Host: www.example.com | Specifies the host being queried. This can  |
|            |                       | be domain name or IP address.               |
------------------------------------------------------------------------------------
| User-Agent | User-Agent:           | Used to describe the client requesting      |
|            | curl/7.77.0           | resources.                                  |
------------------------------------------------------------------------------------
| Referrer   | Referrer:             | Tells where the current request is coming   |
|            | https://www.ex.com    | from.                                       |
------------------------------------------------------------------------------------
| Accept     | Accept: */*           | Signifies which media types the client can  |
|            |                       | can understand.                             |
------------------------------------------------------------------------------------
| Cookie     | Cookie:               | Contains the cookie, or session data. There |
|            | PHPSESSID=ji54sdv37v  | can be multiple cookies attached.           |
------------------------------------------------------------------------------------
| Auth..     | Authorization: BASIC  | Another way, other than the cookie, to      |
|            | jpeghnfow42nvo2       | identify the client. Token is given after   |
|            |                       | successful authentication and unlike cookies|
|            |                       | is storde client-side and retrieved by      |
|            |                       | server per request                          |
------------------------------------------------------------------------------------
