# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password confirmation | string  | null: false |
| user_name             | string  | null: false |
| kana_name             | string  | null: false |
| birthday              | integer | null: false |

### Association

- has_many :items
- has_many :records


## items テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| item_name             | string  | null: false |
| explanation           | text    | null: false |
| category              | integer | null: false |
| situation             | integer | null: false |
| delivery_charge       | integer | null: false |
| area                  | integer | null: false |
| days                  | integer | null: false |
| price                 | string  | null: false |

### Association

- belongs_to :users
- has_one :records


## records テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :homes


## homes テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| post_number           | integer    | null: false |
| area                  | integer    | null: false |
| city                  | string     | null: false |
| house_number          | string     | null: false |
| bilding_name          | string     | null: false |
| phone_number          | string     | null: false |

### Association

- belongs_to :records

