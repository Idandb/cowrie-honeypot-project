#!/bin/bash
tar -czf /var/backups/home-$(date +%F).tar.gz /home || true
