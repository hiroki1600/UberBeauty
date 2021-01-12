# テーブル設計

## users テーブル

| Column             | Type    | Options                     |
| --------           | ------  | -----------                 |
| nickname           | string  | null: false                 |
| email              | string  | null: false, unique: true   |
| encrypted_password | string  | null: false                 |
| first_name         | string  | null: false                 |
| last_name          | string  | null: false                 |
| first_name_kana    | string  | null: false                 |
| last_name_kana     | string  | null: false                 |
| birthday           | date    | null: false                 |

### Association

- has_many :items
- has_many :orders
- has_many :review
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user

## items テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ------------------------------|
| name   | string     | null: false                   |
| text   | text       | null: false                   |
| price  | integer    | null: false                   |
| user   | references | null: false, foreign_key: true|

### Association

- has_many :item_tag_relations
- has_many :tags, through: :item_tag_relations
- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ------------------------------|
| user   | references | null: false, foreign_key: true|
| item   | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## reviews テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ------------------------------|
| name   | string     | null: false                   |
| content| string     | null: false                   |
| score  | integer    | null: false                   |
| user   | references | null: false, foreign_key: true|
| item   | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## relationships テーブル

| Column | Type       | Options                                             |
| ------ | ---------- | ------------------------------                      |
| user   | references | null: false, foreign_key: true                      |
| follow | references | null: false, foreign_key: true  { to-table: :users} |

t.index [:user_id, :follow_id], unique: true

### Association

- belongs_to :user
- belongs_to :follow, class_name: 'User'

## tags テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ------------------------------|
| name   | string     | null: false, uniqueneee: ture |

### Association

- has_many :item_tag_relations
- has_many :items, through: :item_tag_relations

## item_tag_relationships テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ------------------------------|
| item   | references | null: false, foreign_key: true|
| tag    | references | null: false, foreign_key: true|

### Association


## addresses テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| addresses      | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order