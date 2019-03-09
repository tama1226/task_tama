Tasksモデル

|カラム名|データ型|
---|---
|task_name|stirng|
|content|text|
|deadline|date|
|status|string|
|priority|string|
|user_id|integer|

Usersモデル

|カラム名|データ型|
---|---
|name|string|
|email|string|
|password_digest|stirng|

Labelsモデル

|カラム名|データ型|
---|---
|label_name|stirng|

Tagsモデル

|カラム名|データ型|
---|---
|task_id|integer|
|label_id|integer|

