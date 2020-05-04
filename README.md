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
* DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
|name|string|null: false, default: ""|
|profile_photo|string|
### Association
- has_many :posts, dependent: :destroy
- has_many :likes
- has_many :comments



## postテーブル
|Column|Type|Options|
|------|----|-------|
|caption|string|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :photos, dependent: :destroy
- has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy
- has_many :comments, dependent: :destroy



## photoテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|post_id|integer|foreign_key: true, null: false|
### Association
-  belongs_to :post



## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true, null: false|
|post_id|integer|foreign_key: true, null: false|
### Association
-  belongs_to :user
-  belongs_to :post



## commentテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|post_id|integer|foreign_key: true, null: false|
|user_id|integer|foreign_key: true, null: false|
### Association
-  belongs_to :user
-  belongs_to :post