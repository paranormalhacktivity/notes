# File Upload XSS Attack Explained
A File Upload XSS attack exploits the functionality of a web application that allows
users to upload files. If the application does not properly validate or sanitize the
uploaded files, an attacker can upload a malicious file containing executable script
code. When other users download or view this file, the script executes in their browser,
leading to a Cross-Site Scripting(XSS) attack.

## How Does It Work?
1. File Upload Functionality: The attacker finds a file upload feature on a website
(e.g. profile picture, document upload, etc.)

2. Malicious File Creation: The attacker creates a file containing a script. This could
be an HTML file with embedded Javascript, or another type of file that the application
improperly handles.

3. Upload the Malicious File: The attacker uploads the file to the server.

4. Trigger the Execution: The attacker crafts a URL or takes advantage of a feature in
the application that causes another user to view or download the uploaded file.

5. Script Execution: When the victim views or downloads the file, the malicious script
executes in their browser context, leading to an XSS attack.

## Example Scenario:
1. Vulnerable File Upload:
    - A web application has a file upload feature for user avatars.
    - The application does not validate the file type or content properly.

2. Attacker's Steps:
    - The attacker creates an HTML file name `malicious.html` containing...
    ```
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8">
        <title>Malicious Script</title>
      </head>
      <body>
        <script>alert('XSS Attack');</script>
      </body>
    </html>
    ```
    - The attacker uploads `malicious.html` as their avatar.
3. Exploiting the Upload:
    - The application allows the file to be uploaded without checking the file type.
    - The uploaded file is accessible at a link like `http://example.com/uploads/malicious.html`
4. Triggering the XSS:
    - The attacker sends a link to the victim: `http://example.com/uploads/malicious.html`
    - When the victim clicks the link, their browser executes the script in `malicious.html`,
      showing an alert with "XSS Attack".

## Prevention
- Sanitization and Validation: Properly validate and sanitize file uploads. Check file types,
  use whitelist-based file type checks, and ensure files are scanned for malicious content.
- Use antivirus or other content-scanning tools to check uploaded files for malicious content.
- File Storage: Store uploaded files in directories that are not accessible via the web server
  to prevent direct access.
- Content-Type Headers: Ensure the server sends the correct `Content-Type` headers
  for files. Avoid serving user-uploaded files as HTML or other executable formats.
- Security Best Practices:
    - Use a content security policy(CSP) to restrict what scripts can run on your site.
    - Serve files securely by ensuring they are served with appropriate headers to prevent
      execution as code (e.g. `Content-Disposition: attachment`).
    - Implement input validation on both the client and server sides.
    - Regularly update and patch your web application and dependencies to mitigate know
      vulnerabilities.
