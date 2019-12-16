# README

アプリ名:自殺0

概要
人生について考えるアプリ
私は自殺を進めている訳ではない。むしろこの世の中から無くなって欲しいと思う。だがなぜ、日本には自殺する人が多いのか。みんなに考えてもらうためにこのアプリを立ち上げた。

管理者と一般ユーザーの違い
管理者は記事を投稿でき、ユーザーは記事を投稿できない
ユーザーはあくまで記事を閲覧するのみ

管理者は、ユーザーを削除できたり、コメント、記事などを削除することができる
ユーザーは自殺を止めるにはどうしたら良いか投稿できる



|version名|version|
  |:--|--
  |ruby |'2.6.5'|
  |rails |5.2.4'|



カタログ設計
https://docs.google.com/spreadsheets/d/1qfoDhEa6WT6fhZRMnu78lksDmEeCJ5PkA5ULCJf-TJw/edit?usp=sharing

テーブル定義
https://docs.google.com/spreadsheets/d/1qfoDhEa6WT6fhZRMnu78lksDmEeCJ5PkA5ULCJf-TJw/edit#gid=2068684077

画面遷移図
https://docs.google.com/spreadsheets/d/1qfoDhEa6WT6fhZRMnu78lksDmEeCJ5PkA5ULCJf-TJw/edit#gid=653734414

画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1qfoDhEa6WT6fhZRMnu78lksDmEeCJ5PkA5ULCJf-TJw/edit#gid=1136547866

使用予定Gem

|gem一覧|gem名|
  |:--|--
  |１ |devise|
  |2 |omniauth|
  |3|kaminari|
  |4 |google-analytics-rails|
  |5 |omniauth-google-oauth2|
  |6 |omniauth-facebook|
  |7 |omniauth-twitter|






|Functions list|機能名|
  |:--|--
  |１ |googleログイン機能|
  |2 |「自殺について」の投稿|
  |3|「自殺について」の詳細|
  |4 |ページネーション|
  |5 |ログイン機能|
  |6 |コメント機能|
  |7 |フォロー、フォロワー機能|
  |9 |会話機能|
  |10 |twitterログイン機能|
  |11|facebookログイン機能|
