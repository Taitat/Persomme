[![Image from Gyazo](https://i.gyazo.com/6ca5ce31fcb65b290b1b7dae38967474.gif)](https://gyazo.com/6ca5ce31fcb65b290b1b7dae38967474)

# Persomme

PersommeはQ＆AのためのRailsアプリケーションです。  
他のQ＆Aアプリとの違いは質問する相手をペルソナで絞り込める点です。  
また、あなたの持つペルソナについて、他のユーザーからの質問に答えることもできます。  
詳しくは以下をご覧ください。  

Persomme is a rails application for Q&A.  
What makes it different from other Q&A apps is that you can filter the people you ask questions to by persona.  
You can also answer questions from other users about the persona you have.  
For more information, read on below.  

### 概要
主な機能は以下の通りです。  
#### ①質問機能  
[![Image from Gyazo](https://i.gyazo.com/6ca5ce31fcb65b290b1b7dae38967474.gif)](https://gyazo.com/6ca5ce31fcb65b290b1b7dae38967474)  

質問したい相手をペルソナで特定し、質問を送信することができます。  

#### ②回答機能  
[![Image from Gyazo](https://i.gyazo.com/866f299ee242ce2d2700eec20558a7e3.gif)](https://gyazo.com/866f299ee242ce2d2700eec20558a7e3)  

あなたの持つペルソナに他のユーザーから質問が来ることがあります。  

#### ③投稿機能  
[![Image from Gyazo](https://i.gyazo.com/b2da83dc851cee8f6d1a8810afafc141.gif)](https://gyazo.com/b2da83dc851cee8f6d1a8810afafc141)  

質の良いQ＆Aは投稿し、他のユーザーに共有することができます。  

### :globe_with_meridians:URL
https://persommelier.herokuapp.com/    

### 制作背景
アパレルメーカーでブランドの立ち上げを行った際、  
想定するペルソナへのアンケートやリアクションがもっと簡単に取れればブランド開発しやすいだろうと考え、開発に至りました。  
多くの人に使ってもらってペルソナの情報を蓄積できなければ機能しないので、どんな人にも使ってもらえるQ＆Aサイトとして開発しています。

また、質問する側が新たな知見を得られるのと同時に、
回答する側も人に必要とされることで自分の新たな価値に気づくことができるというメリットがあります。
自分では特別だと思っていないことも、誰かにとっては特別なのです。


















### :green_book:開発環境  
Ruby 2.6.5  
Rails 6.0.0  
javascript  
Jquery  
MySQL2  
AWS  
  

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
