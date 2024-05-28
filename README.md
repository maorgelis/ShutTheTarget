**שם הפרויקט:** ShutTheTarget


**שם המתכנת:** מאור גליס
*

**מורה:** ברק צוברי 


**כיתה:** י'2


**בית ספר:** ישיבת בני עקיבא גבעת שמואל 


**שנת הגשה:** 2024 תשפ"ד


**התוכנית**

 בהתחלה מוצג לוגו של שם הפרוייקט ושל שם המתכנת על המסך.
התוכנית מציירת חץ באמצעות קו ישר ושני קווים אלכסונים ומטרה באמצעות עיגולים (עיגול גדול ובתוכו עיגול קטן יותר) המטרה שהחץ יפגע במטרה .
התוכנית מציירת עיגול גדול ועיגול קטן בצד הימני של המסך יחסית באמצע , את החץ התוכנית מציירת בצד השמאלי של הלוח יחסית למעלה.

**כיצד פועלת התוכנית**

כאשר התוכנית מסיימת לצייר את החץ והמטרה היא מבקשת מהמשתמש שילחץ על אחד מהחצים הבאים: למעלה, למטה, שמאלה.
המקש העליון גורם לחץ לעלות בקפיצות של עשר עבור כל פעם שהמשתמש לוחץ על המקש העליון. 
החץ עולה כך: את החץ המקורי מוחקים (צובעים בצבע של המסך ( שחור) ) ואז התוכנית מציירת את החץ כך שערכי הוואי של החץ יעלו בעשר וערכי האיקס לא ייפגעו.
המקש התחתון גורם לחץ לרדת בקפיצות של עשר עבור כל פעם שהמשתמש לוחץ על המקש התחתון. 
החץ יורד כך: את החץ המקורי מוחקים (צובעים בצבע של המסך ( שחור) ) ואז התוכנית מציירת את החץ כך שערכי הוואי של החץ ירדו בעשר וערכי האיקס לא ייפגעו.
המקש השמאלי גורם לחץ לזוז אוטומטית ימינה בקו ישר בקפיצות של שישים ארבע פעמים כלומר כאשר החץ יגיע לערך שוואי יהיה 240 שזה כמעט עד סוף המסך מאורך אחד לשני. 
אם החץ ייפגע במטרה כלומר שהחץ יצוייר בתוך המטרה (ערכי הוואי של החץ (הוואי של הקו הישר) יהיה בין ערכי הוואי של העיגול הגדול של המטרה. 
העיגול הגדול יימחק (ייצבע בשחור ) ואז ייצבע מחדש בצבא צהוב. אם החץ לא ייפגע במטרה התוכנית תצא מהמסך ותיסתיים.

**פעולות שהמשתמש יכול לבצע:**

הוא בוחר לאיפה החץ יכול לזוז (למעלה\ למטה ) ולשגר את החץ בצורה ישרה באמצעות ההחץ השמאלי.

**דוגמאות ריצה**

התוכנית מציגה על המסך לוגו של שם הפרוייקט והמתכנת: 

![צילום מסך 2024-05-28 172853](https://github.com/maorgelis/ShutTheTarget/assets/167463733/d2c9c340-6a3c-4f2d-8231-383e4bbe9895)

התוכנית מציירת מטרה וחץ: 

![צילום מסך 2024-05-28 173003](https://github.com/maorgelis/ShutTheTarget/assets/167463733/46732e06-3d3c-48b3-8fbf-38817e19fa12)

התוכנית מבקשת מהמשתמש ללחוץ על אחד הממקשים (עליון\תחתון\שמאלה):

![צילום מסך 2024-05-28 173059](https://github.com/maorgelis/ShutTheTarget/assets/167463733/45cec8f4-a544-464c-9db1-a81ff12a5ccf)

התוכנית מזיזה את החץ על פי לחיצת המשתמשים (בתמונה לחצתי כבר על החץ כמה פעמים למטה כך שהוא מול המטרה):

![צילום מסך 2024-05-28 173243](https://github.com/maorgelis/ShutTheTarget/assets/167463733/566629ab-9c5c-4f1c-a4bb-97b2a9033891)

התוכנית מבקשת שוב מהמשתמש ללחוץ על אחד מהמקשים ולחצתי על המקש שמאלה (שמשגר את החץ):

![צילום מסך 2024-05-28 173343](https://github.com/maorgelis/ShutTheTarget/assets/167463733/cc9fc662-b32f-49bf-b077-0b0e32aae36a)

החץ פגע במטרה: 

![צילום מסך 2024-05-28 173517](https://github.com/maorgelis/ShutTheTarget/assets/167463733/408db325-aa14-4326-a36e-c9d04b1f04bf)

מטרה נמחקת ונצבעת בצהוב:

![צילום מסך 2024-05-28 173642](https://github.com/maorgelis/ShutTheTarget/assets/167463733/2bc33742-66a5-4187-a77c-f0ead3e25514)

נגמרה התוכנית!

**שלבי הפיתוח:** 

בהתחלה חילקתי את הפרויקט להרבה תתי משימות וכל יום עשיתי תת משימה אחת כך שלבסוף סיימתי את כל הפרוייקט 

בשלב הראשון רק ציירתי את המטרה והחצים .

שלב שני עבדתי על החלק של התזוזה של החץ למעלה ולמטה. 

שלב שלישי עבדתי התזוזוה של החץ כשאר לוחצים על המקש של השיגור.

שלב רביעי צבעתי את המטרה בצהוב עם החץ באמת פגע בה.

שלב חמישי עשיתי את הלוגו עם השם שלי והשם של הפרוייקט. 

שלב שישי כתבתי על כל פונקציה את תוכנית הכניסה והיציאה שלה ורשמתי מה כל משתנה עושה בתוכנית. 

שלב שביעי ואחרון , העליתי את התוכנית לגיט האב ושלחתי את הפרוייקט.

**מה הייתי מציע לעשות בעתיד**

בעתיד הייתי אומר שצריך לבקש משמשתמש מיקום של החץ או של המטרה או מצייר אחד מהם ברנדומליות מהמחשב.

**סיכום אישי**

הפרוייקט היה בהתחלה היה נראה קשה אך עם הזמן שבצעתי את הפרוייקט ווההתקדמות שלי בפרוייקט הבנתי שהוא לא כזה קשה כפי שחשבתי וחששתי בהתחלה ובסופו של דבר נהנתי מלתכנת אותו ובמיוחד שהצלחתי לבצע אותה לבדי ושהתוכנית יצאה טוב מאוד מבחינתי. בזכות התוכנית הצלחתי להבין טוב יותר את שפת התכנות ובכללי הבנתי כיצד לנצל את זמני באופן טוב יותר בזכות הוכנית.
 










 


