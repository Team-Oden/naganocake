# ながのCAKE ECサイト

# 概要
### 長野県にある小さな洋菓子店「ながのCAKE」の商品の通販するためのECサイト開発。

# サイトの説明
### 受注生産型を採用しています。 １日の受注量に制限はありません。 家族や友人など、注文者以外の住所にも商品を発送できます。

# 開発環境
### Cloud9（Amazon Linux 2)

# バックエンド
### ruby 3.1.2

### Rails 6.1.6.1

### SQLite3

# フロントエンド
### HTML

### SCSS

# その他
### bootstrap

### Font Awesome

### kaminari

### devise

### enum_help

### rails-i18n

# ER図
![Kチームおでん](https://user-images.githubusercontent.com/112250615/197967847-4f65146a-30aa-4d36-8797-04a2c0256c65.png)


# 主な機能
### 一般ユーザー
### 顧客は会員登録、ログイン・ログアウト、退会ができます。
### 会員のログインはメールアドレスとパスワードで行います。
### 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示するなどして判断できます。
### サイトの閲覧はログインなしで行えます(Top/Aboutページのみ)。
### 商品をカートに入れ、1度に複数種類、複数商品の購入ができます。また、カート内の商品は個数変更・削除ができます。
### カートへの商品追加はログインなしでは行えなえません。
### 会員はマイページからユーザ情報の閲覧・編集、注文履歴の閲覧、配送先の閲覧・編集ができます。
### 注文履歴一覧には下記の情報が表示されます。
### 購入日
### 配送先
### 支払金額（商品合計＋送料）
### 注文ステータス(入金待ち/発送待ち/発送済) -注文履歴には購入履歴ごとに下記の情報が表示されます。
### 購入日
### 購入内容（商品名、個数、金額、支払い方法など）
### 請求情報（商品合計、送料、支払金額）
### 会員登録時、下記の情報をユーザ情報として入力できます。
### 名前（姓・名）
### 名前（カナ姓・カナ名）
### 郵便番号
### 住所
### 電話番号
### メールアドレス
### パスワード
### 商品は税込価格で表示されます。
### 管理ユーザー
### 管理者用メールアドレスとパスワードでログインできます。
### 商品の新規追加、編集、販売停止が行えます。
### 商品情報は下記のものを持っています。
### 商品名
### 商品説明文
### ジャンル
### 税抜価格
### 商品画像
### 販売ステータス(販売中/販売停止中)
### 会員登録されているユーザ情報の閲覧、編集、退会処理が行えます。
### ユーザの注文履歴が一覧・詳細表示できます。
### 注文履歴には注文ごとに下記の情報が表示されます。
### 購入者
### 注文日
### 配送先
### 支払方法
### 料金（商品合計、送料、請求金額合計）
### 注文ステータス(入金待ち/入金済み/製作中/発送準備中/発送済)
### 各注文商品詳細（商品名、単価(税込)、数量、小計）
### 製作ステータス(製作待ち/製作中/製作完了)
### 注文ステータス、製作ステータスの更新ができます。※
### ※注文・製作ステータスについて

### ステータス名	用途	ステータス	設定タイミング
### 注文ステータス	注文状況を促して、会員の購入履歴にも表示します。	入金待ち	注文した時点でデフォルトで設定されます。
### 入金確認	事務員が入金を確認したら自動で更新して下さい。
### 製作中	紐づく注文商品の製作ステータスが一つでも「製作中」になったら自動更新されます。
### 発送準備中	紐づく注文商品の製作ステータスが「製作完了」になったら自動更新されます。
### 発送済み	事務員が発送完了時に設定します。
### 製作ステータス	各商品の製作状況を表します。内部でのみ使用します。	着手不可	注文した時点でデフォルトで設定されます。
### 製作待ち	紐づく注文ステータスが「入金確認」になったら自動更新されます。
### 製作中	製作に着手するタイミングで管理者が設定してください。
### 製作完了	製作が完了したタイミングで管理者が設定してください。
### 管理者アカウント
### mail : admin@admin
### password : adminadmin
