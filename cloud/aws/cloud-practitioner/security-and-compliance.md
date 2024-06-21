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
