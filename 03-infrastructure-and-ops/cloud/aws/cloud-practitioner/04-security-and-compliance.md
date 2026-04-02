# Security and Compliance
Security is a shared responsibility between AWS and the customer. Understanding this
shared responsibility model is crucial for maintaining a secure cloud environment. Let's
delve into the key concepts and services related to security and compliance on AWS.

## Shared Responsibility Model

### AWS Responsibility(Security "of" the Cloud)
- AWS is responsible for protecting the infrastructure that runs all of the services
offered in the AWS Cloud. This infrastructure is composed of the hardware, software,
networking, and facilities that run AWS Cloud services.

- Includes physical security, environmental security, and the security of the virtualization
layer.

### Customer Responsibility(Security "in" the Cloud)
- Customers are responsible for the security of everything they deploy or use within the AWS
environment

- This includes securing their data, managing user access, configuring network security,
and securing their applications

## Identity and Access Management(IAM)

### Users, Groups, and Roles
- Users: Individual accounts that can sign in to the AWS Management Console or interact
with AWS services programmatically.

- Groups: Collections of IAM users that you can manages as a unit. You can attach policies
to groups to manage permissions.

- Roles: A way to grant permissions to entities you trust (e.g. users, applications, or
services). Roles are assumed by entities and provide temporary security credentials.

### Policies and Permissions
- Policies: Documents that define permissions. Policies are attached to users, groups, or
roles to specify what actions are allowed or denied.

- Permissions: AWS uses policies to determine whether to allow or deny a request made
by an authenticated user or role.

### Multi-Factor Authentication (MFA)
- Adds an extra layer of protection on top of usernames and passwords. With MFA, users
must provide an additional authentication

## Security Services

### AWS Shield
- A managed Distributed Denial of Service (DDoS) protection service that safeguards
application running on AWS.

- AWS Shield Standard: Automatically protects all AWS customers at no extra cost.

- AWS Shield Advanced: Provides additional detection and mitigation against larger
and more sophisticated attacks for an additional cost.

### AWS WAF (Web Application Firewall)
- Helps protect web applications from common web exploits and vulnerabilities.

- Allows you to create custom rules that block common attack patterns, such as SQL
injection or cross-site scripting (XSS)

### AWS Key Management Service (KMS)
- A managed service that makes it easy to create and control encryption across your
applications.

## Compliance

### Shared Responsibility Model
- The shared responsibility model also applies to compliance. AWS manages compliance
"of" the cloud, and customers manage compliance "in" the cloud.

- AWS provides various compliance programs and certifications to help customers meet
regulatory requirements.

### AWS Compliance Programs
- AWS has acheived numerous certifications and third-party attestations to help
customers meet specific regulatory requirements.

- Exampls: SOC 1/2/3, ISO 27001, PCI DSS, HIPAA

## Practical Examples

### Securing an Application
- Use IAM to create users, groups, and roles with the least privilege necessary to
perform their tasks.

- Enable MFA for users to add an extra layer of security.

- Use AWS Shield and WAF to protect against DDoS attacks and common web exploits.

### Encrypting Data
- Use AWS KMS to manage encryption keys for encrypting data at rest.

- Enable encryption for S3 Buckets, EBS volumes, RDS databases using KMS-managed keys.

## Key Terminology
- IAM: Identity and Access Management, a service for managing access to AWS resources.

- MFA: Multi-Factor Authentication, an additional layer of security for user sign-in.

- DDoS: Distributed Denial of Service, an attack aimed at disrupting normal traffic to
a web service.

- WAF: Web Application Firewall, a service that protects web applications from common
web exploits.

- KMS: Key Management Service, a service for managing encryption keys.
