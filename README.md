# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false |




### Association

- has_many :item_users
- has_many :items, through: :item_users

## items テーブル

| Column            | Type   | Options     |
| ------------------| ------ | ----------- |
| image             | string | null: false |
| description       | text   | null: false |
| category          | string | null: false |
| condition         | string | null: false |
| fee               | string | null: false |
| area              | string | null: false |
| day               | string | null: false |
| price             | string | null: false |



### Association

- has_many :item_users
- has_many :items, through: :item_users

## item_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | string     | null: false, foreign_key: true |
| item   | string     | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user