# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| email              | string | null: false unique: true|
| encrypted_password | string | null: false             |
| nickname           | string | null: false             |
| kanji_lastname     | string | null: false             |
| kanji_firstname    | string | null: false             |
| katakana_lastname  | string | null: false             |
| katakana_firstname | string | null: false             |
| birthday_id        | integer| null: false             | 

### Association
- has_many :item
- has_many :comment
- has_many :buy

## items テーブル

| Column            | Type       | Options                       |
| ------------------| ---------- | ------------------------------|
| name              | string     | null: false                   |
| price             | integer    | null: false                   |
| item_text         | text       | null: false                   |
| seller            | string     | null: false                   |
| category_id       | integer    | null: false                   |
| condition_id      | integer    | null: false                   |
| delivery_charge_id| integer    | null: false                   |
| sender_id         | integer    | null: false                   |
| number_day_id     | integer    | null: false                   |
| user_id           | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comment
- has_one :buy

## comments テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| text      | text       | null: false                    |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## buys テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| buyer_name   | string     | null: false                    |
| item_name    | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :place

## places テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| post_code    | integer    | null: false                    |
| city_id      | integer    | null: false                    |
| street       | string     | null: false                    |
| address      | string     | null: false                    |
| building_name| string     |                                |
| phone        | string     | null: false                    |
| buy_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :buy