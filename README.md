# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique :true|
| encrypted_password | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date         | date   | null: false |

### Association
- has_many :items
- has_many :orders
- has_many :addresses

## items テーブル

| Column            | Type    | Options     |
| ------------------| ------  | ----------- |
| product_name      | text    | null: false |
| description       | text    | null: false |
| category_id       | integer | null: false |
| condition_id      | integer | null: false |
| fee_id            | integer | null: false |
| area_id           | integer | null: false |
| day_id            | integer | null: false |
| price             | integer | null: false |

### Association

- belongs_to :user


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | -------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- has_many   :addresses 



## addresses テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card_number    | string     | null: false |
| date_of_expiry | string     | null: false |
| security_code  | string     | null: false |
| post_code      | string     | null: false |
| prefecture     | string     | null: false |
| municipalities | string     | null: false |
| house_number   | string     | null: false |
| building_name  | string     | null: false |
| phone_number   | string     | null: false |


### Association

- belongs_to :orders