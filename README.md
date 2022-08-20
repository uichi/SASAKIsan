# 環境
- Ruby 2.7.4
- Rails 6.1.4.1

# ローカル環境立ち上げ手順
まずはDockerをインストールしてください。
https://docs.docker.com/desktop/mac/install/

## コンテナをビルド
`docker-compose build`

## database.yml作成

configディレクトリ内に作成してください。

```
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password:
  host: localhost

development:
  <<: *default
  database: app_development
  host: db
  username: root
  password: password

test:
  <<: *default
  database: app_test
  host: db
  username: root
  password: password
```

## データベースを作成
`docker-compose run web rails db:create`

## Webpackerをインストール
`docker-compose run web rails webpacker:install`

`Overwrite /app/config/webpack/environment.js? (enter "h" for help) [Ynaqdhm]`と尋ねられたら`n`を入力してそのままエンターを押してください。

## コンテナを起動
`docker-compose up`

localhost:3000にアクセスしてRailsの初期画面が表示されることを確認しましょう。

# docker-compose コマンド操作

## バックグラウンドで起動
`docker-compose up`

## シャットダウン
`docker-compose down`

## コンテナ内のシェルにログイン
`docker-compose exec web sh`

もしくは

`docker-compose exec web /bin/bash`
