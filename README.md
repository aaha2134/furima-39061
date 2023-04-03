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
| date               | string | null: false |

### Association


## items テーブル

| Column            | Type    | Options     |
| ------------------| ------  | ----------- |
| description       | text    | null: false |
| category          | integer | null: false |
| condition         | integer | null: false |
| fee               | integer | null: false |
| area              | integer | null: false |
| day               | integer | null: false |
| price             | integer | null: false |

### Association

- belongs_to :user


## order テーブル

| Column | Type       | Options     |
| ------ | ---------- | ------------|
| user   | string     | null: false |
| item   | string     | null: false |


### Association

- belongs_to :item
- belongs_to :user



## address テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | string     | null: false |
| item   | string     | null: false |



### Association

- belongs_to :item
- belongs_to :user