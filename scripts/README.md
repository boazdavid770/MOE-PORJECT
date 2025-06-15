# 🔍 Log Analyzer Scripts

מערכת Bash מתקדמת לניתוח קובצי לוג מסוג `/var/log/syslog`, עם תמיכה בסינון שגיאות, חיפוש לפי תאריך, הפקת דוחות בפורמט טקסט ו־CSV, ותצוגה צבעונית במסוף.

---

## 📂 קבצים עיקריים

| קובץ | תיאור |
|------|--------|
| `log-analyzer.sh` | סקריפט בסיסי להצגת שורות לוג עם שגיאות (ERROR, WARNING, FAILED) |
| `log-analyzer-stats.sh` | הצגת סטטיסטיקות לפי סוג שגיאה ותאריכים נפוצים |
| `log-analyzer-search.sh` | מאפשר חיפוש לפי תאריך ו/או סוג שגיאה |
| `log-analyzer-report.sh` | מפיק דוח טקסט ו־CSV על שגיאות |
| `log-analyzer-report-colored.sh` | כולל תצוגה צבעונית עם `tput` + דוחות |

---

## 📦 דרישות מערכת

- `bash`
- כלים בסיסיים: `grep`, `awk`, `sort`, `uniq`, `tput`
- מערכת לינוקס (נבדק באובונטו)

---

## 🚀 הוראות הפעלה

```bash
chmod +x scripts/log-analyzer-report-colored.sh
./scripts/log-analyzer-report-colored.sh
