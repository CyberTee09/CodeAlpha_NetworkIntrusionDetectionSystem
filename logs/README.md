# Suricata Log Summary

Suricata generated the following log files during testing:

- `eve.json` — network events and flow records
- `stats.log` — traffic and engine statistics
- `suricata.log` — Suricata operational messages
- `fast.log` — alert log

During the final network capture:

- Interface: eth0
- Packets captured: 886
- Packets dropped: 0
- Invalid checksums: 0

The captured events included normal mDNS and DHCP traffic.

No alert event was generated during the normal traffic test.

Raw Suricata logs are not included in this public repository to avoid unnecessarily exposing network information.
