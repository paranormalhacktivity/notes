# Reflective XSS(Cross-Site Scripting)
Occurs when a web application reflects user input directly back to the client without proper
sanitization. Here's an example of how reflective XSS might work.

## Scenario
Imagine a web application that takes a `search` parameter from the URL and displays
it back to the browser without proper sanitization.

Example Code:
Let's say you have the following vulnerable search page:
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Search</title>
  </head>
  <body>
    <h1>Search Results</h1>
    <p>You searched for: <?php echo $_GET['search']; ?></p>
  </body>
</html>
```

In this example, the `search` parameter from the URL is directly included in the
HTML output.

Exploit:
An attacker can craft a malicious URL like this:
```
http://example.com/search.php?search=<script>alert('XSS')</script>
```

When the victim visits this URL:
The web page will execute the JavaScript code because the input is not properly sanitized:
```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Search</title>
  </head>
  <body>
    <h1>Search Results</h1>
    <p>You searched for: <script>alert('XSS')</script></p>
  </body>
</html>
```
The browse will execute the `<script>alert('XSS')</script>` part, causing a JavaScript alert
with the message "XSS" to appear.

## Prevention
To prevent XSS, always sanitize and escape user inputs. Use functions or libraries
designed to handle these tasks safely. For example, in PHP, you can use `htmlspecialchars()`
to escape HTML special characters.
