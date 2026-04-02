# Hypertext Transfer Protocol Secure(HTTPS)

## Introduction
HTTPS has become the mainstream protocol of the internet. Unlike HTTP, HTTPS encrypts
all data being transferred between client and server so that if anyone were to intercept
the data being transferred, they would not be able to read the data. Most browsers are
even preventing HTTP websites from being visited. A website who uses HTTPS will reflect
so in the protocol portion of the URL, i.e. `https://`.

## HTTPS Flow
If a user types in `http://` instead of `https://` on a website that enforces HTTPS,
the browser will attempt to resolve the domain and redirects the user to the webserver
hosting the target website. A request will first be sent to port 80. The server will
detect this and reroute to port 443. This is done via the 301 HTTP status code, which
stands for "Moved Permanently". The client will send a "client hello" packet, this contains
information about itself. The server will then respond with a "server hello" packet,
followed by a key exchange to exchange SSL certificates. The client verifies the 
key/certificate and sends one of it's own. After this, there is an encrypted handshake
to confirm whether the encryption and transfer are working correctly. Finally, once
the handshake is complete, normal HTTP communication is continued, which is encrypted
after that.

## cURL
cURL should handle all HTTPS communication standards and perform the secure handshake,
as well as encrypting and decrypting the data automatically. If a site is ever requested
that has an invalid or outdated certificate, cURL will not proceed with communication
as protection from potential MITM(man-in-the-middle) attacks. The same would be done
in a modern browser. When testing a local web application, an SSL error might be
present. In this case, the `-k` option can be passed, to skip the certificate check.

## Potential attacks

### HTTP downgrade attack
An attacker may be able to downgrade HTTPS communication to HTTP, thus making the 
data transferred in clear text. This is done via a Man-In-The-Middle proxy setup
to transfer all traffic through the attacker's host without the user's knowledge.
Most modern browsers, servers, and web applications protect against this.
