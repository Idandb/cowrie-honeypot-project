# 🐍 Cowrie Honeypot Project

Web-based SSH/Telnet honeypot for collecting attack logs and analyzing malicious behavior.

---

## 🚀 Quick Start

### Linux
```bash
# יצירת fs.pickle
docker run --rm   -v "$(pwd)/cowrie_honeyfs:/honeyfs_input:ro"   -v "$(pwd)/cowrie_data:/cowrie_output"   cowrie/cowrie:latest   /cowrie/cowrie-git/bin/createfs -v -l /honeyfs_input -d 15 -o /cowrie_output/fs.pickle

# הפעלת המערכת
docker compose up -d
```

### Windows (PowerShell)
```powershell
# יצירת fs.pickle
docker run --rm `
  -v "${pwd}\cowrie_honeyfs:/honeyfs_input:ro" `
  -v "${pwd}\cowrie_data:/cowrie_output" `
  cowrie/cowrie:latest `
  /cowrie/cowrie-git/bin/createfs -v -l /honeyfs_input -d 15 -o /cowrie_output/fs.pickle

# הפעלת המערכת
docker compose up -d
```

---

## 🔧 Management

```bash
docker compose up -d     # הפעלה
docker compose down      # עצירה
docker compose restart   # אתחול
docker ps                # בדיקת קונטיינרים רצים
```

---

## 📊 Usage

1. התחבר ל־SSH:  
   ```bash
   ssh admin@<HOST_IP> -p 2222
   ```
   *(כל סיסמה מתקבלת לפי userdb)*

2. השתמש בפקודות בסיסיות בתוך ה־honeypot:
   ```bash
   ls          # רשימת קבצים
   cd ..       # חזרה אחורה
   cd <dir>    # מעבר לתיקייה
   pwd         # נתיב נוכחי
   cat <file>  # קריאת קובץ
   less <file> # קריאה מדפדפת (q ליציאה)
   whoami      # הצגת המשתמש
   exit        # יציאה
   ```

3. קריאת פקודות מותאמות (txtcmds):  
   ```bash
   cat /usr/bin/<command>
   ```

---

## 📂 Logs

### Linux
```bash
docker compose logs -f
tail -f cowrie_logs/audit.log
tail -f cowrie_logs/cowrie.json
```

### Windows (PowerShell)
```powershell
docker compose logs -f
Get-Content .\cowrie_logs\audit.log -Wait
Get-Content .\cowrie_logs\cowrie.json -Wait
```

---

## 🔗 Integration with Cowrie Logger

This honeypot generates JSON logs in `cowrie_logs/` (mapped to `/var/log/cowrie`).  
To visualize and analyze these logs, you can use [cowrie-logger](https://github.com/Idandb/cowrie-logger).

1. Deploy this honeypot (see Quick Start above).  
2. Run `cowrie-logger`.  
3. Upload or link the generated JSON logs from `cowrie_logs/`.  

---

## ⚠️ Notes
- ברירת מחדל SSH נחשף על פורט `2222`. ניתן לשנות ב־docker-compose.yaml.  
- honeypot מיועד לסביבת בדיקות בלבד – לא להריץ על שרת ייצור.  
