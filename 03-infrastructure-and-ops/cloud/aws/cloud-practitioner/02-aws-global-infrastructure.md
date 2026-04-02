# AWS Global Infrastructure
The AWS global infrastructure is designed to provide a highly available, scalable, and
secure cloud computing environment. It is composed of several key components, including AWS
Regions, Availability Zones, and Edge Locations.

## Key Components

### AWS Regions
- An AWS Region is a physical location around the world where AWS clusters data centers.

- Each Region consists of multiple, isolated, and physically separate Availability Zones
within a geographic area.

- Example Regions: US East (N. Virginia), US West (Oregon), Asia Pacific (Tokyo).

### Availability Zones (AZs)
- Availability Zones are distinct locations within a region that are engineered to be
isolated from failures in other AZs

- Each AZ is composed of one or more data centers equipped with independent power,
cooling, and networking.

- By deploying your applications across multiple AZs, you can achieve high availability
and fault tolerance.

### Edge Locations
- Edge Locations are sites that CloudFront uses to cache copies of your content for
faster delivery to users.

- These are part of AWS's content delivery network (CDN) and are located in major
cities around the world.

- Edge Locations help reduce latency and improve performance for end-users

### Local Zones
- Aws Local Zones place compute, storage, database, and select AWS services closer
to a large population, industry, and IT centers.

- They are ideal for workloads that require single-digit millisecond latency to end-users
or on-premises data centers

### Wavelength Zones
- AWS Wavelength Zones embed AWS compute and storage services within telecommunications
providers' data centers at the edge of the 5G network.

- They are designed to deliver ultra-low latency applications to mobile and connected
devices

## Benefits of AWS Global Infrastructure

### High Availability

- AWS Regions and AZs are designed for fault isolation, ensuring high availability of
applications

- By deploying applications across multiple AZs, you can protect against data center
failures.

### Scalability

- The global reach of AWS allows you to scale your applications to meet demand, regardless,
of where your users are located.

- AWS services can be easily scaled up or down based on demand.

### Security
- AWS data centers are built to the highest standards of security to meet the most
stringent compliance requirements

- Each AWS Region is fully isolated and comprised of multiple AZs, which provide a robust
and resilient infrastructure.

### Performance
- AWS Edge Locations provide a global content delivery network to reduce latency and
improve the performance of your applications

- Local Zones and Wavelength Zones ensure low latency and high performance for specific use
cases.

## Practical Examples

### Deploying a Web Application
- Deploy your web servers in multiple AZs within a Region to ensure high availability.

- Use Amazon CloudFront to cache your content at Edge Locations for faster delivery to users.

### Disaster Recovery

- Implement a disaster recovery strategy by replicating data across multiple Regions.

- Use Amazon Route 53 for DNS failover to ensure your application remains available
even in the event of a Region failure.

## Key Terminology
- Region: A geographic area where AWS has data centers

- Availability Zone (AZ): A distinct location within a Region engineered to be isolated
from failures in other AZs.

- Edge Location: A site used by CloudFront to cache copies of your content for faster delivery

- Local Zone: An extension of an AWS Region that is closer to end-users for low-latency
applications.

- Wavelength Zone: An AWS infrastructure deployment embedded within the telecommunications
providers' data centers at the edge of the 5G network.
