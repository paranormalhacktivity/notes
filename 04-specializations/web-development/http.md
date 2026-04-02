# HyperText Transfer Protocol(HTTP)

## Introduction
Most of internet communication done today, uses HTTP protocol. HTTP is an application-level
protocol used to connect to the web. "Hypertext" is a term to describe text containing
links to other resources. HTTP consist of a client and server. The client sends a request to
the server, asking the server for a specific resource. The server then processes the request
and returns the requested resource. The default port for HTTP is port 80 but this can be
modified.

## URLs
Resources can be accessed over HTTP via URL

### URL structure
The following is an example of a url structure and it's different parts

ex. http://admin:password@example.com:80/index.php?showThings=true#pageId

Breakdown of the example above:
  - `http://` is the scheme. This is used to identify the protocol being used by the client.
  - `admin:password@` is the user. Used to authenticate to the host. Optional.
  - `example.com` is the host. Signifies the resource location. This can be a hostname or IP address.
  - `:80` is the port. If nothing is specified, it will default http to port 80 and https to port 443.
  - `/index.php` is the path to the resource. If no path is specified the server will default to `index.html`.
  - `?showThings=true` is the query string.
  - `#pageId` is the fragement. Fragments are processed client-side in the browser to locate a section on the webpage.

## HTTP Flow
1. A user enters a URL into a browser.
2. The browser then sends the URL to DNS(Domain Name Server) to get the domain and IP address
   (Note: browser will first check the `/etc/hosts` file on the user's machine. If the URL
   is not found there it will begin asking the DNS servers)
3. Once the browser receives the IP address, it will send a GET request to the default HTTP port
   requesting the root path `/`, unless another path was specified in the url.
4. The server will then read and return the contents of the requested path as an HTTP response. This response
   will have an HTTP status code attached, a successful one is a `200`.
5. The web browser finally renders the contents of the requested resource and presents it to the user.

## Requests
An HTTP request is made client-side. It contains all of the information required from
the server. This information includes the resource, request data, and other headers
and options specified. The server then process this information and returns what
is known as an HTTP response. The following is an example of an HTTP request:

ex. GET /home/index.html HTTP/1.1
    Host: example.com
	User-Agent: Mozilla/5.0 (Ubuntu; Linux x86_64;) Firefox/78.0
	Accept: text/html,application,xhtml+xml,application/xml
	Accept-Language: en-US,en;q=0.5
	Accept-Encoding: gzip, deflate
	Content-Type: text/html; charset=UTF-8
	Connection: close
	Cookie: PHPSESSID=jso34vjnkc5snowla55asdv2sfv
	Upgrade-Insecure-Requests: 1
	Cache-Control: max-age=0

The first line of the HTTP request contains three fields separated by space. Here's
the breakdown of the line in the example above:

  - `Method` is the HTTP method or verb, this specifies the type of action to perform. In
     the above example, it is a GET request, therefore the GET method is specified.
  - `Path` is the path to the resource being accessed. This field can be suffixed with
     a query string. In the example above, the path is `/home/index.html`.
  -  `Version` is used to denote the HTTP version. In the example above, it is `HTTP/1.1`.

All of the lines of the HTTP request, that follow are known as HTTP headers. Headers
usually specify various attributes of the requests, they are terminated with a new line.
Although, not shown in the example above, a request may also have a request body and
data attached.

Imporant side note, HTTP 1.X sends request data as clear text, while HTTP 2.X sends
request as binary data in a dictionary form.

## HTTP Response
After the server receives and processes the client's request, the server will then
respond with an HTTP response. The HTTP response structure is very similar to the
HTTP request structure. Here's an example of the HTTP response:

ex. HTTP/1.1 200 OK
    Date: Mon, 14 Mar 2022 7:50:09 CDT
	Server: Apache/2.4.41 (Ubuntu)
	Set-Cookie: PHPSESSID=jso34vjnkc5snowla55asdv2sfv; path=/
	Expires: Thu, 17 Mar 2022 08:30:00 CDT
	Cache-Control: no-store, no-cache, must-revalidate
	Pragma: no-cache
	Vary: Accept-Encoding
	Content-Length: 964
	Connection: close
	Content-Type: text/html; charset=UTF-8

One of the key differences in the request and response, is the first line. In the
response, the HTTP version is specified, but the only other thing present is the
"response code". The `response code`, in the example above's case is a `200 OK`,
it is used to determine the request's status. The rest of the response is very similar
to the request, it consist of several response headers and, although not shown in
the above example, it also has a response body. This response can be html, json,
and even other file types hosted on the webserver.

## HTTP Headers
HTTP Headers pass information between client and server. Some headers pertain to 
both the request and the response, and some are exclusive to one or the other. Headers
can generally be divided into the following categories...
1. General Headers - contextual headers used to describe the message rather than its contents
					 (i.e. Date, Connection, etc.)
2. Entity Headers - common to both requests and responses. Used to describe the content
					transferred by a message. Usually found in responses and POST or PUT requests.
					(i.e. Content-Type, Media-Type, Boundary, Content-Length, Content-Encoding)
3. Request Headers - Used exclusively in HTTP requests. They do not relate to the content
					 of the message.(i.e. Host, User-Agent, Referrer, Accept, Cookie, Authorization)
4. Response Headers - Used exclusively in HTTP responses. Certain response headers do
					  provide more context about the response.
					  (i.e. Age, Location, Server, Set-Cookie, WWW-Authenticate)
5. Security Headers - These headers were designed to enhance security against web
					  based attacks. They are a class of response headers used to
					  specify certain rules and policies to be followed by the browser.
					  (i.e. Content-Security-Policy, Strict-Transport-Security, Referrer-Policy)

## HTTP Methods and Codes
The HTTP supports several methods that allow the browser to send information, forms, or
files to the server. These methods help in telling the server how to process the request
and how to reply. Some of the methods include GET, POST, HEAD, PUT, DELETE, OPTIONS, and
PATCH. HTTP status codes are used to tell the client the status of their request. There 
are 5 different types of response codes, these include 1xx, 2xx, 3xx, 4xx, and 5xx.

## cURL
cURL is a command-line tool that primarily supports HTTP and other protocols. It can be used
to send web requests straight from the command-line, making it extremely useful in scripts
as well as automation. cURL can be used by simply running `curl example.com` from the command-line.
It also has a plethora of options available. Those options can be reviewed by running the command
`man curl` or `curl -h`. cURL returns the contents of a request as raw text. cURL can also be used
to download the page as a file. This makes it extremely handy for searching over the page's code.

By default cURL only returns the response body. However, if the `-v` option is passed, cURL
will provide a full preview of both the HTTP Request and the HTTP Response.

## Browser DevTools
Most modern web browsers come with built-in developer tools, which are mainly intended
for developers but can be very valuable to a pen tester or bug bounty hunter. Like, cURL,
the browser's dev tools can reveal information about the application, specifically, in
the HTTP requests that the page makes. Often times, a single web page, may make several
HTTP requests at once, the DevTools "Network" tab is a great place to see all the
requests that get made.

## Security
A major drawback to using HTTP is that all data transferred is clear text. Anyone between the client
and server is able to intercept the data being transferred. To see a more secure transfer protocol
refer to HTTPS.

## Potential attacks

### Man-in-the-Middle attack
An attacker may be able to set up a proxy in between client and server. Since HTTP's data transfer
is unencrypted, it is very easy for an attacker to steal sensitive information and use it maliciously.
