# テーブル設計

## users テーブル

| Column                | Type    | Options                 |
| --------------------- | ------- | ----------------------- |
| nickname              | string  | null: false             |
| email                 | string  | null: false,unique:true |
| encrypted_password    | string  | null: false             |
| last_name             | string  | null: false             |
| first_name            | string  | null: false             |
| kana_last_name        | string  | null: false             |
| kana_user_name        | string  | null: false             |
| birthday              | date    | null: false             |

### Association

- has_many :items
- has_many :records


## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | string     | null: false                    |
| explanation           | text       | null: false                    |
| user                  | references | null: false, foreign_key: true |
| category_id           | integer    | null: false                    |
| situation_id          | integer    | null: false                    |
| delivery_charge_id    | integer    | null: false                    |
| area_id               | integer    | null: false                    |
| shipping_day_id       | integer    | null: false                    |
| price                 | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :record


## records テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :home


## homes テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| post_number           | string     | null: false                    |
| area_id               | integer    | null: false                    |
| city                  | string     | null: false                    |
| house_number          | string     | null: false                    |
| bilding_name          | string     |                                |
| phone_number          | string     | null: false                    |
| record                | references | null: false, foreign_key: true |

### Association

- belongs_to :record

