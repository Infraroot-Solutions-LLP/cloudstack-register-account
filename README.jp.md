これは何？
============
CloudStackアカウントの登録/削除を行う軽量なWebアプリケーションです．

使い方
===========
まずはCloudMonkeyをインストールします:

```bash
sudo apt-get update
sudo apt-get install python-pip
sudo pip install cloudmonkey
```

```
cloudmonkey
> set host 10.0.0.1
> set port 8080
> set apikey <admin api key>
> set secretkey <admin secret key>
> set display json
> sync
> exit
```

Railsをインストール:

```bash
sudo apt-get update
sudo apt-get install ruby1.9.3 git libsqlite3-dev build-essential
sudo gem1.9.3 install bundler
git clone https://github.com/penguin2716/cloudstack-register-account.git
cd cloudstack-register-account
bundle install
```

CloudStackの管理サーバのホスト名（もしくはIPアドレス）とポート番号を設定:

```bash
vim config/environment.rb
```

```ruby
CLOUDSTACK_HOST = '10.0.0.1'
CLOUDSTACK_PORT = 8080
```

アカウント管理サーバを起動:

```bash
rails server -p 8080
```

サーバ起動後， http://yourserver:8080 にアクセスするとWebUIが表示されます．

![Screenshot](https://dl.dropboxusercontent.com/u/195878/github-images/cloudstack-register-account-screenshot.png)

ライセンス
==========
MITライセンスです．
