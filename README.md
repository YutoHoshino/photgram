# README

デプロイ先: https://photogram2020.herokuapp.com/

# 概要
Instagram風の写真投稿SNSを作成する

- Ruby on Railsにて開発。
- HTML/CSS/Bootstrapを使用して、実際のInstagramを意識したデザインを適用。
- 画像の投稿・編集・投稿一覧表示・削除機能を実装。
- ログイン機能、ユーザ詳細画面。
- いいね機能、コメント機能。
- ユーザーのプロフィール画像がない場合はデフォルト画像を適用。


# DB設計
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