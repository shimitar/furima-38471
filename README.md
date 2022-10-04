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
| birthday_id        | date   | null: false             | 

### Association
- has_many :items
- has_many :comments
- has_many :buys

## items テーブル

| Column            | Type       | Options                       |
| ------------------| ---------- | ------------------------------|
| name              | string     | null: false                   |
| price             | integer    | null: false                   |
| item_text         | text       | null: false                   |
| category_id       | integer    | null: false                   |
| condition_id      | integer    | null: false                   |
| delivery_charge_id| integer    | null: false                   |
| sender_id         | integer    | null: false                   |
| number_day_id     | integer    | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many   :comments
- has_one    :buy

## comments テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| text      | text       | null: false                    |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## buys テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :place

## places テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| sender_id    | integer    | null: false                    |
| street       | string     | null: false                    |
| address      | string     | null: false                    |
| building_name| string     |                                |
| phone        | string     | null: false                    |
| buy          | references | null: false, foreign_key: true |

### Association
- belongs_to :buy