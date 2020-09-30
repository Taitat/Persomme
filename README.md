

# Persomme

PersommeはQ＆AのためのRailsアプリケーションです。  
他のQ＆Aアプリとの違いは質問する相手をペルソナで絞り込める点です。  
また、あなたの持つペルソナについて、他のユーザーからの質問に答えることもできます。  

Persomme is a rails application for Q&A.  
What makes it different from other Q&A apps is that you can filter the people you ask questions to by persona.  
You can also answer questions from other users about the persona you have.  
For more information, read on below.  
<br>

<br>

## :globe_with_meridians:URL
https://persommelier.herokuapp.com/    
<br>
<br>
  
## :green_book: 制作背景
アパレルメーカーで新規ブランドの開発に携わった際、  
想定するペルソナへのアンケートやリアクションがもっと簡単に取れればブランド開発しやすいだろうと考え、開発に至りました。  
多くの人に使ってもらってペルソナの情報を蓄積できなければ機能しないので、どんな人にも使ってもらえるQ＆Aサイトとして開発しています。  
<br>
また、質問する側が新たな知見を得られるのと同時に、  
回答する側も人に必要とされることで自分の新たな価値に気づくことができるというメリットがあります。   
個が強調される時代に、自分の価値に気づくことは非常に重要です。  
自分では特別だと思っていないことも、誰かにとっては特別だということです。  
<br>
そのような、参加したユーザー全員が主役になれるサービスを目指しました。
<br>
<br>

## :pushpin: 工夫したポイント
ユーザー自身のペルソナをどのように設定してもらうか、そしてそれをどのように検索してもらうかという点です。  

ユーザー自身のペルソナはトップページに常にランダムで表示されるアンケートに回答することで蓄積していきます。　　  
時折インパクトのあるアンケートも織り交ぜ、つい回答して次のアンケートを見たくなるようにしています。  

また、質問を作成する際のペルソナ設定では、非同期通信を用いてサジェストと設定（解除）が直感的にできるようにしています。  
設定したら質問の送信と同時に設定したペルソナの情報がコントローラーに渡り、合致するユーザーにのみ、回答リクエストを送信します。　　

以上のように、体験デザインを意識して、ユーザーが使いやすいUIを心がけています。  
<br>
<br>
  
  

## :tv: DEMO  
主な機能は以下の通りです。  
#### ①質問機能  
質問したい相手をペルソナで特定し、質問を送信することができます。
[![Image from Gyazo](https://i.gyazo.com/6ca5ce31fcb65b290b1b7dae38967474.gif)](https://gyazo.com/6ca5ce31fcb65b290b1b7dae38967474)  

  

#### ②回答機能  
あなたの持つペルソナに他のユーザーから質問が来ることがあります。  
[![Image from Gyazo](https://i.gyazo.com/acbb7c014141f8c248b52b68cdb7e749.gif)](https://gyazo.com/acbb7c014141f8c248b52b68cdb7e749)


#### ③投稿機能  
質の良いQ＆Aは投稿し、他のユーザーに共有することができます。  
[![Image from Gyazo](https://i.gyazo.com/447c62b8f5c331e12e62b14c3ca5068d.gif)](https://gyazo.com/447c62b8f5c331e12e62b14c3ca5068d)



<br>
その他、以下の機能があります。<br>
・　いいね機能<br>
・　コメント機能<br>
・　ペルソナ作成機能<br>
・　ジャンル検索機能<br>
<br>
<br>

## :wrench: 開発環境  
#### サーバーサイド  
◆Ruby 2.6.5  
◆Rails 6.0.0  
<br>
#### フロントサイド  
◆HTML  
◆CSS  
◆javascript    
◆Jquery  
<br>
#### 開発環境  
◆MySQL2  
<br>
#### 本番環境  
◆AWS (EC2,S3,VPC,Route53,RDS)    
◆MySQL2  
<br>
#### テスト  
◆Rspec (単体／結合）   
<br>
#### その他使用技術  
◆非同期通信  
◆ransack  
◆Rubocop  
◆チーム開発を意識したGitHubの活用 （プルリク、マージ）  


## :page_facing_up: DB設計
### 【ER図】  
![DBMS ER 図 (UML 表記) (5)](https://user-images.githubusercontent.com/67946046/93851048-64afa180-fcea-11ea-8ee3-cbed0cf0b964.png)



  




