# README

# :pushpin: アプリ紹介

## :computer: 主な使用言語・ソフトウェア

<img src="https://github.com/s79ns/oa/blob/master/app/assets/images/ruby-logo.png" width="20%"><img src="https://github.com/s79ns/oa/blob/master/app/assets/images/rails_logo.png" width="20%"><img src="https://github.com/s79ns/oa/blob/master/app/assets/images/haml.png" width="20%"><img src="https://github.com/s79ns/oa/blob/master/app/assets/images/sass.png" width="20%"><img src="https://github.com/s79ns/oa/blob/master/app/assets/images/mysql.png" width="20%">

## :speech_balloon: アプリケーション名

GE-app
## :本番環境 url

👉[こちらが本番環境のurl](http://54.168.10.101/)
## : log in用 アカウント

- mail-address<br>
Andy@com
- password<br>
andy6221


## :eyes: 作成理由

英語を学ぶ上でオンライン上ですぐ質問できてなおかつ自分が学んだことを周りにシェアできるようなコミュニティーを作りたいという思いから作成しました。

## 工夫した点

一見

## :eyes: 機能紹介

こちらは英語、日本語学習コミュニティーを作り、どんな時でもログインしているuserに質問、アウトプットできるアプリケーションです。
機能一覧
1. ユーザーのログイン、ログアウト、プロフィール編集(ユーザーマイページ画面にて)
[マイページ画面](https://gyazo.com/b1908591d9161fee5207de35977e299e)
2. 投稿機能 簡単なタイトルをつけ英語または、日本語に関する質問ができます。また、写真を添付して投稿も可能です。投稿をしたユーザーのみ投稿の編集と削除が可能です。

3. コメント機能 コメントのアイコンをクリックすると、コメントができる画面に遷移し投稿にコメントすることができます。コメントしたユーザーはコメントの削除はできません。投稿したユーザーだけがコメントの削除が可能です。コメント、コメント削除に関しては非同期処理になっています。
4. 検索機能 投稿のタイトル、内容を対象に検索することができます。

## 実装機能予定
1. いいね機能
2. 音声データ添付機能
3. google翻訳api



## :green_book: 使い方

ユーザー新規登録後、ユーザー情報編集・新規投稿・投稿内容の編集・削除機能、コメント機能を使用する事ができます。

## :memo: インストール方法

`git clone https://github.com/Shuhei-Kubo/ge-app.git`<br>
\$ `cd oa`<br>
\$ `bundle install`<br>
\$ `rails db:create`<br>
\$ `rails db:migrate`<br>
\$ `rails s`<br>
👉 `http://localhost:3000`

## :wink: 作者

Shuhei-Kubo

## :relaxed: 作者より

ご覧いただきありがとうございます。<br>

# DB 設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| last_name_kanji  | string | null: false |
| first_name_kanji | string | null: false |
| profile_image    | string | null: false |
| profile_text     | text   |             |
### Association

- has_many :posts
- has_many :comments
- has_many :likes


## posts テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| title           | string  | null: false |
| image           | string  |             |
| text            | text    | null: false |
| user_id         | integer | null: false |


### Association

- belongs_to :user
- has_many :comments
- has_many :likes

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| comment    | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| postt_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post

## likes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| nickname   | string     | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| post_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
