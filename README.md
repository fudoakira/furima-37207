#テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :orders

## Items テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| item_name | string  | null: false |
| content   | text    | null: false |
| price     | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item_detail

## Orders テーブル

| Column | Type       | Options    |
| ------ | ---------- | ---------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## Item_detail テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| category            | string | null: false |
| item_quality        | string | null: false |
| shipping_fee_burden | string | null: false |
| ship_form_area      | string | null: false |
| days_to_ship        | string | null: false |

### Association

- belongs_to :item

## Shipping_address テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | integer | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building       | string  |             |
| phone_number   | integer | null: false |

### Association

- belongs_to :order