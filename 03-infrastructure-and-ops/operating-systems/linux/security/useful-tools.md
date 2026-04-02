# Useful Tools for Linux Security

## Intrusion Detection System(IDS)

### Fail2Ban
Monitors logs and bans IP addresses after a specified number of failed login attempts,
protecting against brute-force attacks.

### Snort
A powerful network intrusion detection system (NDIS) that monitors network traffic
in real-time and alerts on suspicious activity.

### OSSEC
A host-based IDS that monitors system logs, file integrity, rootkits, and more.

## System Monitoring

### Prometheus and Grafana
Collects system metrics like CPU, memory, disk usage, and network traffic, and visualizes
them in dashboards.

- Installation: Requires setting up prometheus for data collection and Graffana for
visualization.

- Usage: Use pre-built dashboards to monitor your server's health in real time.

### Zabbix
Another powerful monitoring tool that provides detailed insights into your server's
performance and security.

### Netdata
A lightweight, real-time performance monitoring tool that offers insights into your
server's health with minimal setup.

## File Integrity Monitoring

### Tripwire
Monitors and alerts on changes to critical system files, helping you detect unauthorized
changes.

### AIDE (Advanced Intrusion Detection Environment)
Another tool for monitoring file integrity, checking for unauthorized changes.

## Firewall Management

### UFW/GUFW
The Uncomplicated Firewall (and it's graphical counterpart) for managing firewall
rules easily.

### IPTables
For advanced users, IPTables provides more granular control over network traffic
and firewall rules.

## Log Monitoring and Management

### Logwatch
A customizable log analysis tool that summarizes logs and sends reports via email.

### Graylog
A powerful log management tool that collects, indexes, and analyzes log data in real-time.

## Security Auditing

### Lynis
An in-depth security auditing tool for Linux systems. It can scan your system for
security issues, configuration mistakes, and vulnerabilities.

## Rootkit Detection

### RKHunter
Scans your system for rootkits and suspicious files.

### Chkrootkit
Another rootkit detection tool.

## Two-Factor Authentication (2FA)

### Google Authenticator
Adding 2FA to your SSH login enhances security by requiring a one-time code in
addition to your password.
