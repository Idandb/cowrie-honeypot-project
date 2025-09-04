🐍 Cowrie Honeypot Project

Web-based SSH/Telnet honeypot for collecting attack logs and analyzing malicious behavior.

🚀 Quick Start
Linux
# יצירת fs.pickle
docker run --rm \
  -v "$(pwd)/cowrie_honeyfs:/honeyfs_input:ro" \
  -v "$(pwd)/cowrie_data:/cowrie_output" \
  cowrie/cowrie:latest \
  /cowrie/cowrie-git/bin/createfs -v -l /honeyfs_input -d 15 -o /cowrie_output/fs.pickle

# הפעלת המערכת
docker compose up -d

Windows (PowerShell)
# יצירת fs.pickle
docker run --rm `
  -v "${pwd}\cowrie_honeyfs:/honeyfs_input:ro" `
  -v "${pwd}\cowrie_data:/cowrie_output" `
  cowrie/cowrie:latest `
  /cowrie/cowrie-git/bin/createfs -v -l /honeyfs_input -d 15 -o /cowrie_output/fs.pickle

# הפעלת המערכת
docker compose up -d

🔧 Management
docker compose up -d     # הפעלה
docker compose down      # עצירה
docker compose restart   # אתחול
docker ps                # בדיקת קונטיינרים רצים

📊 Usage

התחבר ל־SSH:

ssh admin@<HOST_IP> -p 2222


(כל סיסמה מתקבלת לפי userdb)

השתמש בפקודות בסיסיות בתוך ה־honeypot:

ls          # רשימת קבצים
cd ..       # חזרה אחורה
cd <dir>    # מעבר לתיקייה
pwd         # נתיב נוכחי
cat <file>  # קריאת קובץ
less <file> # קריאה מדפדפת (q ליציאה)
whoami      # הצגת המשתמש
exit        # יציאה


קריאת פקודות מותאמות (txtcmds):

cat /usr/bin/<command>

📂 Logs
Linux
docker compose logs -f
tail -f cowrie_logs/audit.log
tail -f cowrie_logs/cowrie.json

Windows (PowerShell)
docker compose logs -f
Get-Content .\cowrie_logs\audit.log -Wait
Get-Content .\cowrie_logs\cowrie.json -Wait

⚠️ Notes

ברירת מחדל SSH נחשף על פורט 2222. ניתן לשנות ב־docker-compose.yaml.

honeypot מיועד לסביבת בדיקות בלבד – לא להריץ על שרת ייצור.
