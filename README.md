*Project Title/タスク管理システムの開発*
---
（株）万葉様の新入社員教育用のカリキュラムを元に、タスク管理システムを作成

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
|deadline|datetime|
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

*Deployment / デプロイ*
---
1.コミットをする
git commitコマンドを使用して、コミットをする。
`
$ git add -A
$ git commit -m "（コミットメッセージ）"
`

2.Herokuに新しいアプリケーションを作成する
`
$ heroku create
`

3.Herokuにデプロイをする
`
$ git push heroku master
`

4.データベースの移行
`
$ heroku run rails db:migrate
`
*Herokuデータベースの作成は自動で行われるが、マイグレーション（テーブル作成）は手動で実行する必要がある。

⇨アプリケーションにアクセスできれば成功。
Herokuアプリのアドレスはhttps://アプリ名.herokuapp.com/ のように設定される。


