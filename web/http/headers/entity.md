# Entity Headers

## Overview
Entity headers are common to both requests and responses. Used to describe the content
transferred by a message. Usually found in responses and POST or PUT requests.

## Examples
------------------------------------------------------------------------------------
| Header     | Example               | Description                                 |
------------------------------------------------------------------------------------
| Content-   | Content-Type:text-html| Describes the type of resource being        |
| Type       |                       | transferred.                                |
------------------------------------------------------------------------------------
| Media-Type | Media-Type:           | Describes the data being transferred.       |
|            | application/pdf       |                                             |
------------------------------------------------------------------------------------
| Boundary   | boundary=             | Acts as a marker to separate content when   |
|            | "b4e4fbd93540"        | when there is more than one in the message. |
------------------------------------------------------------------------------------
| Content-   | Content-Length: 200   | The size of entity being passed.            |
| Length     |                       |                                             |
------------------------------------------------------------------------------------
| Content-   | Content-Encoding: gzip| Data can go through multiple transformations|
| Encoding   |                       | before being passed. The specifies the      |
|            |                       | the encoding used.                          |
-----------------------------------------------------------------------------------
