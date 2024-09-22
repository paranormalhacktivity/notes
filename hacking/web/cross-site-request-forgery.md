# Cross-Site Request Forgery (XSRF/CSRF) Attack

## Overview
Cross-Site Request Forgery (XSRF or CSRF) is a type of attack where an attacker tricks
a user into performing actions on a web application on which they are authenticated,
without their consent. The attacker typically does this by sending a forged request
from another website or through malicious code embedded in an email or web page. Since
the request is sent from the user's browser, and the user is already authenticated, the
web application believes the request is legitimate, thus executing it with the user's
privileges.

## How CSRF Works
CSRF exploits the trust that a web application has in the authenticated user. The
attack relies on the victim having an active session with the target web application
(i.e. being logged in) and then being tricked into executing an unwanted action.

## Step-by-Step Process

### 1. Victim Logs In
The victim logs into a web application (e.g. their bank account) and a session is
established. This session might involve setting a session cookie in the user's browser.

### 2. Attacker Prepares the Attack
The attacker creates a malicious website, email, or script that sends a request to the
web application, leveraging the victim's active session. This request is crafted to
perform a sensitive action, such as transferring money or changing account details.

### 3. Victim Visits Malicious Site
The victim is tricked into visiting the malicious site, clicking a link, or interacting
with a script. Since the request comes from the victim's browser, the browser automatically
includes the session cookie or other credentials that authenticate the victim with the web
application.

### 4. Web Application Executes the Request
The web application receives the forged request and sees that it is authenticated
(because of the session cookie). The application processes the request as if it was made
by the victim, performing the action without the victim's consent.

## Example
Suppose a banking application has a form that allows users to transfer money:
```HTML
<form action="https://bank.example.com/transfer" method="POST">
  <input type="hidden" name="toAccount" value="987654321">
  <input type="hidden" name="amount" value="1000">
  <input type="submit" value="Transfer">
</form>
```

The attacker could craft a similar form on their malicious website:
```HTML
<form action="https://bank.example.com/transfer" method="POST">
  <input type="hidden" name="toAccount" value="attacker_account">
  <input type="hidden" name="amount" value="1000">
  <input type="submit" value="Click me">
</form>
```
When the victim clicks the submit button on the malicious website, their browser sends
the request processed, transferring money to the attacker's account.

## Characteristics of CSRF Attacks

### Invisibility to the User
The attack is usually invisible to the user, who remains unaware that an action
has been performed on their behalf.

### Dependency on User's Session
The attack relies on the fact that the user is authenticated and has an active
session with the target web application.

### Cross-Origin Requests
CSRF typically involves requests made from another domain (hence "cross-site") that
the web application trusts because they come from the user's browser.

## Common Targets for CSRF Attacks

- Banking Transactions: Transferring money, paying bills, or modifying account details.

- Changing User Settings: Modifying email addresses, passwords, or other personal information.

- Performing Administrative Actions: For applications where users have administrative roles,
CSRF can be used to create new users, change permissions, or delete data.

## Mitigation Techniques

### CSRF Tokens
Anti-CSRF Tokens can be used. Include a unique token in each form submission or API
request. The token is generated server-side and is validated on form submissio. Since
the token is not stored in cookies, an attacker cannot easily forge it.

Example:
```HTML
<input type="hidden" name="csrf_token" value="random_csrf_token_value">
```

```
POST /transfer HTTP/1.1
Host: bank.example.com
Content-Type: application/x-www-form-urlencoded

toAccount=987654321&amount=1000&csrf_token=random_csrf_token_value
```
The server checks if the token in the request matches the one stored in the session.
If they do not match, the request is rejected.

### SameSite Cookie Attribute
Modern browsers support the `SameSite` attribute for cookies, which prevents cookies
from being sent with cross-site requests. Setting `SameSite=Lax` or `SameSite=Strict`
can protect against CSRF by ensuring that cookies are not sent with cross-origin
requests.

Example:
```
Set-Cookie: session_id=abc123; SameSite=Lax
```

### Referer and Origin Header Validation
Validate the `Referrer` or `Origin` headers in the incoming requests to ensure that they
originate from the expected domain.

Example:
```
Referer: https://bank.example.com/transfer
```

The drawbacks of this, is that this method is less reliable since some users or proxies
might strip out these headers for privacy reasons.

### Custom Request Headers
For AJAX requests, require requests that perform sensitive actions to include
custom headers, which browsers do not automatically include in cross-origin requests.

Example:
```
POST /api/update-user
X-Requested-With: XMLHttpRequest
```
### Double-Submit Cookies
Send the CSRF token in both a cookie and a request parameter, and validate that they
match on the server-side.

Example:
```
POST /transfer
Cookie: csrf_token=random_csrf_token_value
csrf_token=random_csrf_token_value
```

### User Interaction Confirmation
Require user interaction (such as CAPTCHA, re-entering a password, or clicking a
confirmation link) before performing sensitive actions. This can ensure that the
request is legitimate and intended.

## Conclusion
CSRF is a powerful attack technique that exploits the trust a web application has
in a user's browser. By tricking the user into unknowingly submitting a request, an
attacker can perform actions with the user's privileges. Mitigating CSRF attacks
requires a combination of techniques, including the use of anti-CSRF tokens, SameSite
cookies, header validation, and user interaction confirmations. By implementing these
defenses, web developers can significantly reduce the risk of CSRF attacks and protect
their applications from unauthorized actions.
