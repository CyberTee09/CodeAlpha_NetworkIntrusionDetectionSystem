# Task 4 — Suricata Intrusion Detection System

## Objective

The objective of this task was to install, configure, validate, and test Suricata as a Network Intrusion Detection System (NIDS) on Kali Linux.

## Environment

- Operating System: Kali Linux
- Suricata Version: 8.0.6 RELEASE
- Network Interface: eth0
- IP Address: 192.168.0.137
- Network: 192.168.0.0/24

## Configuration and Testing

Suricata was successfully configured and its configuration was tested using:

    sudo suricata -T -c /etc/suricata/suricata.yaml

The configuration loaded successfully.

Suricata rules were updated using:

    sudo suricata-update

The installed rules file was confirmed at:

    /var/lib/suricata/rules/suricata.rules

A total of 52,414 alert rules were identified.

## Network Monitoring

Suricata was started on the eth0 interface using:

    sudo suricata -i eth0 -c /etc/suricata/suricata.yaml

During testing, Suricata captured 886 packets with 0 packets dropped and 0 invalid checksums.

## Logs and Events

Suricata generated event and statistics files including:

- eve.json
- stats.log
- suricata.log
- fast.log

The eve.json file contained recorded network flow events, including mDNS and DHCP traffic.

No security alert was generated during the normal traffic test.

## Conclusion

The task successfully demonstrated the installation, configuration, rule management, network monitoring, and logging capabilities of Suricata 8.0.6.
