What's this?
============
This is a lightweight web application to register/unregister accounts for your CloudStack.

How to use?
===========
Install and setup cloudmonkey first:

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

Then, install rails:

```bash
sudo apt-get update
sudo apt-get install ruby1.9.3 git libsqlite3-dev build-essential
sudo gem1.9.3 install bundler
git clone https://github.com/penguin2716/cloudstack-register-account.git
cd cloudstack-register-account
bundle install
```

Set hostname (or ip address) and port number of your cloudstack management server:

```bash
vim config/environment.rb
```

```ruby
CLOUDSTACK_HOST = '10.0.0.1'
CLOUDSTACK_PORT = 8080
```

Launch server:

```bash
rails server -p 8080
```

and just access to http://yourserver:8080.

![Screenshot](https://dl.dropboxusercontent.com/u/195878/github-images/cloudstack-register-account-screenshot.png)

LICENSE
=======
MIT license.
