*Project Title/タスク管理システムの開発*
---
（株）万葉様の新入社員教育用かカリキュラムを元に、タスク管理システムを作成

*開発環境*
---
言語・ミドルウェアのバージョン情報

・Ruby　2.5.1
・Ruby on Rails 5.2.2
・postgreSQL 10.5

*各テーブル詳細*
---
Tasksモデル

|カラム名|データ型|
---|---
|name|stirng|
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
|name|stirng|

Tagsモデル

|カラム名|データ型|
---|---
|task_id|integer|
|label_id|integer|

**

