# Web Applications

## Overview
Web applications are interactive applications that run on the web. They generally
have a client-server architecture. The client-side(browser) is what the user actually
sees, while the server-side(backend server/databases) is what the user interacts with
via the client. Feautures of web applications include real-time dynamic changes to
design while still being accessible worldwide. Web applications typically have 
dynamic pages, they're interactive, functional, and can even present different users
different views. This type of functionality is considered "Web 2.0".

## Differences from websites
Web applications are dynamic and pages in these applications can be changed in 
real time. This is a key difference between web applications and websites. Static
web pages, which historically have been used by the internet as part of "Web 1.0"
were used to statically represent specific information that cannot be changed via
user interaction. Therefore, because a static web page does not change based on
user interaction, the web page is the same for all users who visit. In order to 
change the information shown on a static page, a developer must manually change
the information shown on the page.

## Difference from Native OS applications
Web applications are platform independent. They are hosted on the world wide web,
where anyone who wants to access them can, regardless of what OS the user is running.
Also because these applications are hosted on the web, users have no need to install
anything to run them, therefore there is no space taken up on the user's hard drive.
Another big advantage that web applications have over native OS applications, is
that all users access the same version of the application, which allows for the
continuous update of the application and prevents the need to communicate updates
to the end user. However, Native OS applications have the advantage over web applications
when it comes to performance. Native OS applications are usually faster than their
web counterparts. Not only are load times faster with Native OS applications, but
they also are a bit more capable because they have direct access to the OS, where
web applications are limited to the capabilities of the browser. Recently, hybrid
and progressive web applications have become more popular. These web applications 
utilize modern frameworks and Native OS capabilities and resources to make the 
web application faster and more capable than regular web applications.

## Security
With the rise of web applications, security becomes more of a concern for companies
whom have a web presence. Because web applications are accessible worldwide, this
increases the risk of exposure to cyber threats. Complexity of web applications is
on the rise, which also increases the possibility of vulnerabilities being built into
their design. This is the perfect storm for an attack. A successful attack could lead
to significant losses and massive interruptions, not to mention PR disaster. All of
this has created massive demand for vulnerability testing, making pentesting a very
lucrative skill to acquire. For pentesters to sufficiently test web applications,
they must learn how they work and understand what security risk may appear in each
layer. One of the most current and widely used methods for testing web applications
is the OWASP Web Security Testing Guide, it contains many of the most common security
vulnerabilities found on the web. Common testing methods also include starting with
frontend components, to find security vulnerabilities such as Sensitive Data Exposure
and Cross-Site Scripting(XSS). Once finished with the frontend, testing should be
on the web application's core functionality and interaction between client and server.
Testing is often done through an authenticated and unauthenticated perspective, so as 
to cover all possible attack scenarios.

### Common attacks and their real world application
```
-------------------------------------------------------------------------------
| Attack           | Scenario
-------------------------------------------------------------------------------
| SQL Injection    | Obtaining Active Directory usernames and performing      |
|                  | password spraying attack against vpn or email portal     |
-------------------------------------------------------------------------------
| File Inclusion   | Reading source code to find a hidden page or directory   |
|                  | which exposes additional functionality that can be used  |
|                  | to gain remote code execution                            |
-------------------------------------------------------------------------------
| Unrestricted File| A web application that allows profile picture upload that|
| upload           | allows any file type. Allows malicious code to be        |
|                  | uploaded
-------------------------------------------------------------------------------
| Insecure Direct  | When combined with a flaw such as broken access control  |
| Object           | this can be used to access another user's files or       |
| Referencing(IDOR)| functionality. Example, changing user id in URL to edit  |
|                  | someone else's profile
-------------------------------------------------------------------------------
| Broken Access    | Registering a new account, if the account registration   |
| Control          | functionality is designed poorly, a user may perform     |
|                  | privilege escalation when registering. i.e. changing the |
|                  | role_id params to something else.
-------------------------------------------------------------------------------
```
