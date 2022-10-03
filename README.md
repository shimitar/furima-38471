# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ------------------------|
| email              | string | null: false unique: true|
| password           | string | null: false             |
| nickname           | string | null: false             |
| kanji_lastname     | string | null: false             |
| kanji_firstname    | string | null: false             |
| katakana_lastname  | string | null: false             |
| katakana_firstname | string | null: false             |
| birthday           | date   | null: false             | 

## items テーブル

| Column         | Type       | Options                       |
| ---------------| ---------- | ------------------------------|
| name           | string     | null: false                   |
| price          | integer    | null: false                   |
| category       | string     | null: false                   |
| condition      | references | null: false                   |
| item_text      | text       | null: false                   |
| delivery_charge| integer    | null: false                   |
| sender         | string     | null: false                   |
| seller         | string     | null: false                   |
| number_day     | integer    | null: false                   |

## comments テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| text      | text       | null: false                    |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

## buys テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| item_name | references | null: false, foreign_key: true |
| buyer_name| references | null: false, foreign_key: true |

## places テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| post_code    | references | null: false  foreign_key: true |
| city         | references | null: false, foreign_key: true |
| street       | references | null: false, foreign_key: true |
| address      | references | null: false, foreign_key: true |
| building_name| references | null: false, foreign_key: true |
| phone        | references | null: false, foreign_key: true |