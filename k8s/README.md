
# take list of firewall rules and convert to comma separated list
# pbpaste | python3 -c "import fileinput; print(','.join([i.strip() for i in list(fileinput.input())]))"


gcloud compute --project=meat-cloud firewall-rules create cloudflare-ipv4 \
    --direction=INGRESS \
    --priority=1000 \
    --network=default \
    --action=ALLOW \
    --rules=all \
    --source-ranges=173.245.48.0/20,103.21.244.0/22,103.22.200.0/22,103.31.4.0/22,141.101.64.0/18,108.162.192.0/18,190.93.240.0/20,188.114.96.0/20,197.234.240.0/22,198.41.128.0/17,162.158.0.0/15,104.16.0.0/13,104.24.0.0/14,172.64.0.0/13

