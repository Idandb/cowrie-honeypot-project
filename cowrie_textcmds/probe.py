#!/usr/bin/env python3
import os

print("--- Probe Script Output ---")

# הנתיב כפי שהוא ממופה ומזוהה על ידי cowrie.cfg כ-textcmds_path, ובתוכו usr/local/bin
path_to_check_host_mapped = "/cowrie/cowrie-git/txtcmds/usr/local/bin/"

# הנתיב כפי שהתוקף רואה אותו ב-PATH שלו (שמקורו ב-honeyfs ובפקודות המוטמעות)
path_to_check_honeypot_view = "/usr/local/bin/"

print(f"\n[INFO] Attempting to list: {path_to_check_host_mapped} (Cowrie's internal view of host mapped textcmds)")
try:
    files = os.listdir(path_to_check_host_mapped)
    print(f"[SUCCESS] Contents: {files}")
    for f in files:
        print(f"    - {f}")
except Exception as e:
    print(f"[ERROR] Could not list {path_to_check_host_mapped}: {e}")

print(f"\n[INFO] Attempting to list: {path_to_check_honeypot_view} (Honeypot user's PATH view)")
try:
    files_honeypot = os.listdir(path_to_check_honeypot_view)
    print(f"[SUCCESS] Contents: {files_honeypot}")
    for f in files_honeypot:
        print(f"    - {f}")
except Exception as e:
    print(f"[ERROR] Could not list {path_to_check_honeypot_view}: {e}")

print("\n--- Probe Script End ---")