# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column          | Type   | Options                       |
| ----------------| ------ | ----------------------------- |
| nickname        | string | null: false,                  |
| email           | string | null: false, uniqueness: true |
| password        | string | null: false, uniqueness: true |

### Association

- has_many :questions
- has_many :answers
- has_many :comments
- has_many :posts
- has_many :attributes through: :user_attributes
- has_many :user_attributes



## attributes テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| attribute           | text       | null: false                    |

### Association

- has_many :users through: :user_attributes
- has_many :user_attributes



## user_attributes テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| attribute           | references | null: false, foreign_key: true |

### Association

- has_many :users through: :user_attributes
- has_many :user_attributes



## questions テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| title               | string     | null: false                    |
| content             | text       | null: false                    |
| genre_id            | integer    | null: false                    |

### Association

- belongs_to :user
- has_one_attached :image
- has_many :answers
- has_one :post
- belongs_to_active_hash :genre



## ActiveStorage テーブル



## answers テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| question            | references | null: false, foreign_key: true |
| content             | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :question
- has_one_attached :image



## posts テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| question            | references | null: false, foreign_key: true |
| checked             | boolean    | null: false                    |

### Association

- belongs_to :user
- belongs_to :question
- has_many :comments


## comments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| post                | references | null: false, foreign_key: true |
| content             | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :post



### active_hash

- category
- condition
- handling_time
- postage_payer
- prefecture