# Core AWS Services
AWS offers a wide range of services that fall into several key categories. Let's explore
some of the most important ones:

## Compute Services

### Amazon EC2 (Elastic Cloud Compute)
- Provides scalable virtual servers (instances) in the cloud.

- You can choose different instance types based on your needs (e.g. compute-optimized,
memory-optimized).

- Features include auto-scaling, load balancing, and various pricing models (on-demand,
reserved, spot instances)

### AWS Lambda
- A serverless compute service that lets you run code without provisioning or mangaging
servers

- You only pay for the compute time you consume

- Ideal for event-driven architecture (e.g. responding to changes in data, system state, or
user actions)

### Amazon ECS (Elastic Container Service) and Amazon EKS (Elastic Kubernetes Service)
- ECS: A container orchestration service that supports Docker containers and allows
you to run and scale containerized applications.

- EKS: A managed Kubernetes service that makes it easy to run Kubernetes on AWS without
needing to install and operate your own Kubernetes control plane.

## Storage Services

### Amazon S3 (Simple Storage Service)
- Provides scalable object storage for a wide range of use cases (e.g. data backup,
archival, big data analytics)

- Features include versioning, lifecycle policies, and various storage classes (e.g.
Standard, Infrequent Access, Glacier)

### Amazon EBS (Elastic Block Store)
- Provides block storage volumes for use with Amazon EC2 instances.

- Volumes are automatically replicated within an Availability Zone to protect against
component failure.

### Amazon Glacier
- A low-cost cloud storage service for data archiving and long-term backup.

- Provides secure, durable, and extremely low-cost storage with retrieval times ranging
from minutes to hours.

## Database Services

### Amazon RDS (Relational Database Service)
- Provides managed relational databases with support for multiple database engines (e.g.
MySQL, PostgreSQL, Oracle, SQL Server)

- Features include automated backups, software patching, and scalability.

### Amazon DynamoDB
- A fully managed NoSQL database service that provides fast and predictable performance
with seamless scalability

- Ideal for applications that require consistent, single-digit millisecond latency at any
scale.

### Amazon Redshift
- A fully managed data warehousing service that allows you to analyze data using standard
SQL and existing Business Intelligence (BI) tools.

- Designed for large-scale data analysis and reporting.

## Networking Services

### Amazon VPC (Virtual Private Cloud)
- Allows you to provision a logically isolated section of the AWS cloud where you can
launch AWS resources in a virtual network you define.

- You have complete control over your virtual networking environment, including selection
of IP address range, creation of subnets, and configuration of route tables and network
gateways.

### AWS Direct Connect
- A cloud service solution that makes it easy to establish a dedicated network connection
from your premises to AWS

- Helps reduce network costs, increase bandwidth throughput, and provide a more consistent
network experience.

### Amazon Route 53
- A scalable Domain Name System (DNS) web service designed to route end-users to internet
applications

- Features include domain registration, DNS routing, and health checking.

## Practical Examples

### Deploying a Scalable Web Application
- Use Amazon EC2 instances with an Auto Scaling group to handle varying levels of
traffic

- Store static assets (e.g. images, videos) in Amazon S3

- Use Amazon RDS for a managed relational database

- Distribute traffic across multiple EC2 instances using Elastic Load Balancing (ELB)

### Building a Serverless Application
- Use AWS Lambda to run backend code in response to HTTP requests via Amazon API Gateway

- Store user data in Amazon DynamoDB

- Use Amazon S3 for static website hosting and file storage

## Key Terminology
- Instance: A virtual server in the cloud

- Bucket: A container for objects stored in Amazon S3

- Volume: A block storage device that can be attached to an Amazon EC2 instance.

- Cluster: A group of interconnected servers working together.

- Endpoint: A URL that provides access to an AWS service.
