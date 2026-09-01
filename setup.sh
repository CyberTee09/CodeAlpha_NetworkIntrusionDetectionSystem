#!/bin/bash

echo "=== CodeAlpha Task 4 - Suricata and Wazuh Verification ==="

echo ""
echo "1. Checking Suricata version..."
suricata --build-info

echo ""
echo "2. Checking Suricata service..."
sudo systemctl is-active suricata

echo ""
echo "3. Testing Suricata configuration..."
sudo suricata -T -c /etc/suricata/suricata.yaml

echo ""
echo "4. Checking Suricata rules..."
ls -lh /etc/suricata/rules/

echo ""
echo "5. Checking configured rule files..."
sudo suricata --dump-config | grep -i rule-files

echo ""
echo "6. Checking Suricata EVE JSON log..."
if [ -f /var/log/suricata/eve.json ]; then
    echo "EVE JSON log exists: /var/log/suricata/eve.json"
else
    echo "EVE JSON log not found."
fi

echo ""
echo "7. Checking Wazuh Manager..."
sudo systemctl is-active wazuh-manager

echo ""
echo "8. Checking recent Suricata alerts in Wazuh..."
sudo grep -i suricata /var/ossec/logs/alerts/alerts.log | tail -5

echo ""
echo "=== Verification Complete ==="
