how to create fs.pickle:
docker run --rm -v C:\cowrie_honeypot\cowrie_honeyfs:/honeyfs_input:ro -v C:\cowrie_honeypot\cowrie_data:/cowrie_output cowrie/cowrie:latest /cowrie/cowrie-git/bin/createfs -v -l /honeyfs_input -d 15 -o /cowrie_output/fs.pickle
