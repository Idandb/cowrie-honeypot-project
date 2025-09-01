---
title: מצגת סיכום: פרויקט Cowrie Honeypot
author: צוות HIT_Server_Project
date: 2025-09-01
---

## שקופית 1: כותרת ופתיח
- **נושא**: הקמה ותצורה של Cowrie Honeypot בסביבת Docker
- **מטרה**: להבין את הארכיטקטורה, הקבצים החשובים וזרימת העבודה
- **מה נקבל**: סקירה תמציתית, דגשים תפעוליים וטיפים לניתוח לוגים

## שקופית 2: מה זה Cowrie?
- **Cowrie**: honeypot אינטראקטיבי המדמה SSH/Telnet כדי ללכוד ניסיונות פריצה
- **יכולות**: רישום מקיף של פקודות, הורדות קבצים, ו־TTY logs
- **שימושים**: מחקר איומים, זיהוי טכניקות תוקפים, העשרת מודיעין סייבר

## שקופית 3: מבנה המאגר
- **docker-compose.yaml**: מריץ image `cowrie/cowrie:latest`, ממפה פורט `2222`
- **cowrie_etc/cowrie.cfg**: קובץ התצורה הראשי (hostname, לוגים, shell, proxy/pool)
- **נתיבים ממופים**:
  - `cowrie_honeyfs` – תוכן קבצים ו־FS וירטואלי
  - `cowrie_data` – מצב ונתוני ריצה (כולל `fs.pickle`)
  - `cowrie_logs` – לוגים מסתובבים (`rotating`)
  - `cowrie_textcmds` – פקודות טקסט פשוטות
  - `cowrie_tty_logs` – תמלילי TTY

## שקופית 4: נקודות תצורה חשובות (cowrie.cfg)
- **hostname**: `HIT_Server_Project`
- **logtype**: `rotating`, אזור זמן: `UTC`
- **shell.components**: `base, fs, login, textcommands, ...`
- **filesystem**: `data/fs.pickle` (נוצר ע"י `createfs`)
- **proxy.backend**: `pool` עם `pool_max_vms=5`, שיתוף אורחים: `true`
- **pool**: מצב `local`, תקשורת `listen_endpoints=tcp:6415`
- **nat_public_ip**: `192.168.1.40` (בעת שימוש ב־NAT)
- **backend credentials**: `root/root` (לסביבת בדיקה בלבד!)

## שקופית 5: הפעלה ותפעול
- **הרצה**: `docker compose up -d` (פורט מארח `2222` → קונטיינר)
- **חומרה/קבצים**: ודאו קיום `fs.pickle` תחת `cowrie_data`
- **יצירת fs.pickle**:
  - Windows example: `docker run --rm -v C:\cowrie_honeypot\cowrie_honeyfs:/honeyfs_input:ro -v C:\cowrie_honeypot\cowrie_data:/cowrie_output cowrie/cowrie:latest /cowrie/cowrie-git/bin/createfs -v -l /honeyfs_input -d 15 -o /cowrie_output/fs.pickle`
- **לוגים חשובים**: `var/log/cowrie`, `var/lib/cowrie/tty`, `downloads`

## שקופית 6: אבטחה וטיפים
- **אל תחשפו** סיסמאות/מפתחות אמיתיים; השאירו אישורי בדיקה בלבד
- **הקשחת מארח**: הגבל גישה לפורט 2222 חיצוני/רשת בדיקה
- **ניתוח**: עקבו אחרי `cowrie.log-*`, נתחו TTY ו־downloads לזיהוי IoCs
- **קסטומיזציה**: הוסיפו פקודות לטקסט תחת `cowrie_textcmds` והרחיבו FS
- **סגירה**: `docker compose down` והעתקת לוגים לניתוח המשכי

