# Suricata and Wazuh Log Summary

Suricata generated network security events during the testing and monitoring stages of the project.

## Suricata Log Files

The main Suricata log files used during the implementation included:

* `eve.json` — structured network events and security alerts.
* `stats.log` — Suricata traffic and engine statistics.
* `suricata.log` — Suricata operational and service messages.
* `fast.log` — alert information where applicable.

The primary log used for the Wazuh integration was:

```text
/var/log/suricata/eve.json
```

## Wazuh Monitoring

The Suricata EVE JSON events were monitored by Wazuh.

A Suricata event was successfully observed in the Wazuh alert data with:

* **Rule ID:** 86601
* **Alert Level:** 3
* **Event:** ET POLICY Possible Kali Linux hostname in DHCP Request Packet

This confirmed that Suricata was generating security events and that the events were being received and analysed by Wazuh.

## Log Privacy

Raw Suricata and Wazuh logs are not included in this public repository because they may contain network addresses, host information or other environment-specific information.

The repository therefore contains documentation describing the relevant logs and the results observed during testing rather than publishing the complete raw log files.
