#!/bin/bash

echo "=== Suricata Task 4 Setup and Verification ==="

echo ""
echo "1. Checking Suricata version..."
suricata --version

echo ""
echo "2. Updating Suricata rules..."
sudo suricata-update

echo ""
echo "3. Testing Suricata configuration..."
sudo suricata -T -c /etc/suricata/suricata.yaml

echo ""
echo "4. Checking installed rules..."
ls -lh /var/lib/suricata/rules/

echo ""
echo "5. Checking configured rule files..."
sudo suricata --dump-config | grep -i rule-files

echo ""
echo "=== Verification Complete ==="

