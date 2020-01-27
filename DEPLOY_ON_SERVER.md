# How to deploy the demo shop on a server #

Hi! Here is an instruction :)

# Deploy

## Preparing
First you need a server. Then you shall install:
* nginx,
* node.js (v10 or later),
* npm (comes with node.js),
* mysql-server.

I use Debian 9 stretch and every further command in the instruction is for this system. You can use any system you want, differences are minor.

## Repositories
* Frontend (react): https://github.com/crystalbit/react-demo-shop-front
* Backend (node.js): https://github.com/crystalbit/node-demo-shop-api
* also you will need this repository

Note that current repository has a database dump and a directory with images for the products. It is used like an install script for uploads and a database.
And this readme is the last but not least option here :)

## Get repos
Clone the three repositories in your home dir (whenether you want, I use homedir in this example):
```console
$ cd ~
$ git clone git@github.com:crystalbit/react-demo-shop-front.git
$ git clone git@github.com:crystalbit/node-demo-shop-api.git
$ git clone git@github.com:crystalbit/demo-shop-howto-deploy.git
```

## Configure, install and build the frontend
Install:
```console
$ cd ~
$ cd react-demo-shop-front
$ npm install
$ cp src/config.sample.js src/config.js
```

To configure you should edit `src/config.js` file:
```javascript
export default ({
    api: {
        entry: '/api/'
    },
    directories: {
        images: '/images/'
    }
});
```

Building:
```console
$ npm run build
```

## Import MySQL dump with products
First create a database and a user.
Then import schema and products:
```console
$ cd ~
$ mysql -u mysql_username -p database_name < demo-shop-howto-deploy/database/install.sql
```
Ready!

## Install, run and set startup script for backend
First install pm2 npm package globally
```console
$ sudo npm install pm2 -g
```

Then install app dependencies and config:
```console
$ cd ~
$ cd node-demo-shop-api
$ npm install
$ cp config.sample.js config.js
```

Use this settings for `config.js`:
```javascript
module.exports = {
    mysql: {
        host: 'localhost',
        port: 3306,
        user: 'mysql_username',
        password: '',
        database: 'database_name',
        prefix: 'inno_'
    }
}
```

Feel free to fill config with your MySQL login, password, etc.

Run:
```console
$ pm2 start "npm start" --name api
```

Check there are no errors:
```console
$ pm2 log api
```

You shall see
```
0|api  | > node-demo-shop-api@1.0.0 start /home/user/node-demo-shop-api
0|api  | > node index
0|api  | API started at port 3333
```

Set to startup:
```console
$ pm2 startup
```

Then follow instructions (it depends on your system and permissions)

## Setup nginx
Last but not least

**Note:** do not use nginx for dev environment

You need to configure nginx to serve requests to backend, frontend and assets correctly

Edit nginx config as root:
```console
sudo nano /etc/nginx/sites-enabled/default
```

Use this config (it was prepared by me and only for you, guys):
```yml
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /home/user/react-demo-shop-front/build;

        location / {
                try_files $uri /index.html;
        }

        location /images/ {
                alias /home/user/demo-shop-howto-deploy/images/;
        }

        location ~* /api/ {
                proxy_pass http://127.0.0.1:3000;
        }
}
```

**!!!** replace `/user/` with your user username!

Restart nginx:
```console
$ sudo systemctl restart nginx
```

It shall restart silently without errors and warnings

## Conclusion
You are great. Now you can visit the shop by ip in a browser

## Tests
Where are also tests for both frontend and backend - [look here](./TESTING.md)