#!/bin/bash

# הגדרת נתיב קובץ הלוג
LOG_FILE="/var/log/syslog"

# בדיקה אם קובץ הלוג קיים
if [[ ! -f "$LOG_FILE" ]]; then
    echo "שגיאה: קובץ הלוג '$LOG_FILE' לא נמצא."
    exit 1
fi

echo "קורא את התוכן של '$LOG_FILE':"
echo "-------------------------------------"

# הצגת 10 השורות האחרונות של קובץ הלוג
tail "$LOG_FILE"

echo "-------------------------------------"
echo "שורות המכילות את המילים ERROR, WARNING או FAILED:"
echo "-------------------------------------"

# סינון שורות הכוללות את מילות המפתח (לא תלוי רישיות)
grep -iE 'error|warning|failed' "$LOG_FILE"

echo "-------------------------------------"
echo "סטטיסטיקות:"
echo "-------------------------------------"

# ספירת שגיאות לפי סוג
echo "סה\"כ ERROR:   $(grep -i 'error' "$LOG_FILE" | wc -l)"
echo "סה\"כ WARNING: $(grep -i 'warning' "$LOG_FILE" | wc -l)"
echo "סה\"כ FAILED:  $(grep -i 'failed' "$LOG_FILE" | wc -l)"

echo ""
echo "התאריכים הנפוצים ביותר לשגיאות/התראות:"
grep -iE 'error|warning|failed' "$LOG_FILE" | awk '{print $1, $2}' | sort | uniq -c | sort -nr | head -10

echo "-------------------------------------"
echo "סיים לקרוא את קובץ הלוג."
