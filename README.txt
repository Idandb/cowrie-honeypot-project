יצירת fs.pickle

(חובה להריץ פעם אחת או אחרי שינוי honeyfs)

Linux
docker run --rm \
  -v "$(pwd)/cowrie_honeyfs:/honeyfs_input:ro" \
  -v "$(pwd)/cowrie_data:/cowrie_output" \
  cowrie/cowrie:latest \
  /cowrie/cowrie-git/bin/createfs -v -l /honeyfs_input -d 15 -o /cowrie_output/fs.pickle

ls -lh cowrie_data/fs.pickle

Windows (PowerShell)
docker run --rm `
  -v "${pwd}\cowrie_honeyfs:/honeyfs_input:ro" `
  -v "${pwd}\cowrie_data:/cowrie_output" `
  cowrie/cowrie:latest `
  /cowrie/cowrie-git/bin/createfs -v -l /honeyfs_input -d 15 -o /cowrie_output/fs.pickle

Get-Item .\cowrie_data\fs.pickle

הפעלה / עצירה / אתחול
Linux
docker compose up -d     # הפעלה
docker compose down      # עצירה
docker compose restart   # אתחול
docker ps                # בדיקת קונטיינרים רצים

Windows (PowerShell)
docker compose up -d
docker compose down
docker compose restart
docker ps

בדיקה בחיבור SSH
ssh admin@<HOST_IP> -p 2222
# סיסמה כלשהי תתקבל (userdb מוגדר x:*)

לוגים
Linux
docker compose logs -f
tail -f cowrie_logs/audit.log
tail -f cowrie_logs/cowrie.json

Windows (PowerShell)
docker compose logs -f
Get-Content .\cowrie_logs\audit.log -Wait
Get-Content .\cowrie_logs\cowrie.json -Wait

פקודות בתוך המערכת (ה-honeypot)
ניווט וקריאה
ls              # רשימת קבצים בתיקייה
cd <dir>        # מעבר לתיקייה אחרת
cd ..           # חזרה תיקייה אחת אחורה
pwd             # הצגת הנתיב הנוכחי
cat <file>      # הצגת תוכן קובץ
less <file>     # גלילה בתוכן קובץ (q ליציאה)

txtcmds (פקודות טקסט מותאמות)

הקבצים נמצאים תחת cowrie_textcmds. כדי לקרוא אותם:

cat /usr/bin/<command>
# למשל אם יצרת txtcmds/usr/bin/vi → הרצה של "vi" במערכת תציג את תוכן הקובץ

שימושים נוספים
whoami          # הצגת שם המשתמש
exit            # יציאה מהמערכת

הערות

ברירת מחדל SSH נחשף על פורט 2222. ניתן לשנות ב־docker-compose.yaml ל־"22:2222" אם רוצים.

userdb מוגדר כך שכל סיסמה מתקבלת.

אל תריץ על שרת פרודקשן אמיתי.

Eden, רוצה שאכין לך את זה כקובץ README.txt להורדה ישירה?
