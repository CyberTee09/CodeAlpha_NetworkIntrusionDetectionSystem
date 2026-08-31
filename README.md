# CodeAlpha Network Intrusion Detection System

## Overview

This project implements a Network Intrusion Detection System (NIDS) using **Suricata** and **Wazuh** in a virtualised laboratory environment.

Suricata was configured to monitor network traffic and generate security events. The events were written to Suricata's EVE JSON log and integrated with Wazuh for centralized security monitoring, alert analysis, visualization and Active Response.

## Laboratory Environment

The project used the following components:

* **Ubuntu** — Suricata installation and network monitoring
* **Kali Linux** — Wazuh Manager and Wazuh Dashboard
* **Suricata** — Network Intrusion Detection System
* **Wazuh** — Security monitoring and Active Response
* **VirtualBox** — Virtualisation platform

## Architecture

```text
Network Traffic
      |
      v
   Suricata
      |
      v
 EVE JSON Log
      |
      v
     Wazuh
      |
      v
 Wazuh Manager
      |
      v
 Wazuh Dashboard
      |
      +------------------+
      |                  |
      v                  v
 Alert Monitoring   Active Response
```

## Project Objectives

The main objectives of the project were to:

1. Install and configure Suricata.
2. Configure and verify Suricata detection rules.
3. Monitor network traffic using Suricata.
4. Generate and verify Suricata security events.
5. Integrate Suricata events with Wazuh.
6. Monitor Suricata alerts through the Wazuh Dashboard.
7. Configure and test Wazuh Active Response using `host-deny` and `firewall-drop`.
8. Create a visualization of Suricata alerts over time.
9. Document the implementation and supporting evidence.

## Key Implementation Steps

### 1. Suricata Setup

Suricata was installed on Ubuntu and its installation was verified using:

```bash
suricata --build-info
```

The configuration was tested using:

```bash
sudo suricata -T
```

The test confirmed that the Suricata configuration was valid.

### 2. Network Monitoring

Suricata was configured to monitor network traffic and generate security events.

The EVE JSON log used for event monitoring was:

```text
/var/log/suricata/eve.json
```

### 3. Wazuh Integration

The Suricata EVE JSON events were integrated with Wazuh.

Wazuh was used to collect and analyse the Suricata events and display the resulting alerts through the Wazuh monitoring environment.

A Suricata alert observed in Wazuh included:

```text
Rule ID: 86601
Level: 3
Suricata: Alert - ET POLICY Possible Kali Linux hostname in DHCP Request Packet
```

### 4. Active Response

### Active Response – Firewall Blocking

Wazuh Active Response was configured to automatically execute the `firewall-drop` command when a Suricata alert matching rule ID `86601` is detected. The source IP associated with the alert is passed to the firewall-drop command and blocked for 600 seconds.

```xml
<!-- Define the firewall-drop command -->
<command>
  <name>firewall-drop</name>
  <executable>firewall-drop</executable>
  <expect>srcip,data.src_ip</expect>
  <timeout_allowed>yes</timeout_allowed>
</command>

<!-- Trigger firewall blocking on Suricata alerts -->
<active-response>
  <command>firewall-drop</command>
  <location>local</location>
  <rules_id>86601</rules_id>
  <timeout>600</timeout>
</active-response>
```

The configuration was tested successfully, and the resulting Suricata alerts and Wazuh dashboard visualization were captured as evidence in the screenshots directory.


### 5. Alert Visualization

A line visualization was created in the Wazuh Dashboard to display alert counts over time.

The visualization used:

* **Data source:** Wazuh Alerts
* **Metric:** Count
* **X-axis:** Date histogram
* **Time field:** `@timestamp`
* **Minimum interval:** 1 hour
* **Chart type:** Line

The visualization was saved as:

**Suricata Alerts Over Time**

## Repository Structure

```text
CodeAlpha_NetworkIntrusionDetectionSystem/
│
├── documentation/
│   └── Task4-Report.md
│
├── logs/
│
├── screenshots/
│
├── .gitignore
├── README.md
└── setup.sh
```

## Evidence

Screenshots are maintained in the `screenshots` directory and provide evidence of the Suricata configuration, monitoring, Wazuh integration, Active Response configuration and dashboard visualization.


## Troubleshooting

During the implementation, issues were encountered with the Wazuh JSON decoder and VirtualBox clipboard functionality.

The Wazuh environment displayed:

```text
wazuh-analysisd: ERROR: Too many fields for JSON decoder
```

The Wazuh Manager was subsequently checked and confirmed to be active.

VirtualBox clipboard functionality was also restored after troubleshooting and restarting the virtual machine environment.

Network connectivity between the virtual machines was verified using ping tests.

## Results

The project demonstrated:

* Successful Suricata installation and configuration.
* Successful Suricata configuration testing.
* Network traffic monitoring.
* Generation of Suricata security events.
* Integration of Suricata events with Wazuh.
* Visibility of Suricata alerts in Wazuh.
* Configuration of Wazuh Active Response.
* Visualization of alert activity through the Wazuh Dashboard.

## Conclusion

The project demonstrates how Suricata and Wazuh can be combined to provide network intrusion detection, centralized security monitoring and an Active Response capability.

Suricata provides network traffic inspection and event generation, while Wazuh provides centralized alert analysis, monitoring, visualization and response capabilities.

## Project

**CodeAlpha Cybersecurity Internship**

**Task:** Network Intrusion Detection System using Suricata and Wazuh
