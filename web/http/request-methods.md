# HTTP Methods

## Overview
The HTTP methods help to communicate with the browser. They are used to tell the
server how to process the request that is sent and how to reply.

## Methods
-------------------------------------------------------------------------------
| Method     | Description                                                    |
-------------------------------------------------------------------------------
| GET        | Request a specific resource. Can send query params in URL.     |
-------------------------------------------------------------------------------
| POST       | Send data to server. Can handle multiple types of input.       |
|            | Commonly used when sending information.                        |
-------------------------------------------------------------------------------
| HEAD       | Requests the headers that would be returned if GET request was |
|            | made. No body is returned.                                     |
-------------------------------------------------------------------------------
| PUT        | Creates new resource on the server. Should put proper controls |
|            | on this to prevent malicious activity.                         |
-------------------------------------------------------------------------------
| DELETE     | Deletes and existing resource on the web server. Should put    |
|            | proper controls on this to prevent Denial of Service(DoS). DoS |
|            | attack can work by deleting critical files on the server.      |
-------------------------------------------------------------------------------
| OPTIONS    | Returns information about the server, such as methods that it  |
|            | accepts.                                                       |
-------------------------------------------------------------------------------
| PATCH      | Applies partial modification to the resource at the specified  |
|            | location.                                                      |
-------------------------------------------------------------------------------


### GET requests
Often used by web applications for functionalities like search and accessing pages.
Parameters can be sent but are sent in the URL as query params.

### POST requests
Generally used to transfer files or move the user parameters out of the URL. Instead
a POST will place the parameters inside the request body. Advantages of this include...

  -  Lack of logging - it would be inefficient for the server to log a file being
     transferred in the URL.

  -  Less Encoding Requirements - URLs are meant to shared which means they must
     have specific encoding. This is not the case for the data placed in the request
	 body when a POST request is used, the data can be transferred as binary.

  -  More can be sent - URLs have a limit on length that varies between browsers.
     A good rule of thumb is that URLs should be under 2,000 characters, therefore
	 they cannot handle a lot of data.

### PUT Requests
These request are used to modify the specified resource on the server. Much like a
POST, the parameters are sent in the request body.

### DELETE Requests
These requests are used to delete the specified resource from the server. Because of
the nature of the request, if the request was made with Content-Type set as application/json,
an empty string, empty array, or empty object would be returned with a 200 status code,
indicating that the record was successfully deleted.

## Security
It would be considered a vulnerability if any and all users could make crud request
on any part of the website. To combat this, most web application will implement policies
to protect from resources in the server being modified by anybody. A user must have
special permission to perform these actions.
