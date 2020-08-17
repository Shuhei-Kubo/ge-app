# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
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
