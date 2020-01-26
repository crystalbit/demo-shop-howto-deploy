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

**Note:** for dev environment on your localhost you shall use any browser plugin, what can enable CORS for a webpage because backend app and frontend app are on different ports and a browser restricts requests to another port as like it is another domain.

## Repositories
* Front (react): https://github.com/crystalbit/react-demo-shop-front
* Back (node.js): https://github.com/crystalbit/node-demo-shop-api
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

## Configure, install and build the front
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

**Note:** for dev environment on localhost you should use `entry: 'http://localhost:3333/api/'`

Building:
```console
$ npm run build
```

## Import MySQL dump with products and assets
TODO!

## Install, run and set startup script for back
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
    prod: {
        mysql: {
            host: 'localhost',
            port: 3306,
            user: '',
            password: '',
            database: 'pizzashop',
            prefix: 'inno_'
        }
    }
}
```

Feel free to fill config with your MySQL login, password, etc.

TODO to make info on test and dev databases if I implement it

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
0|api  | Connection has been established successfully.
```

Set to startup:
```console
$ pm2 startup
```

Then follow instructions (it depends on your system and permissions)

## Setup nginx
Last but not least

**Note:** do not use nginx for dev environment

You need to configure nginx to serve requests to back, front and assets correctly

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

# Testing
You can easily run tests for both frontend and backend in the dev environment.

## Testing backend
Move to backend project directory and run `npm test`

There are 4 tests now:
* `db-order.js` tests order database functions: creates an order and adds order position to it;
* `db-product.js` tests product database functions: creates, modifies and looks for a product;
* `server-list-products.js` emulates server and fetches product list via http query;
* `server-push-orders.js` emulates server and creates new order with existing api.

## Sample backend test output
```console
➜  node-demo-shop-api git:(feature-tests) npm test 
> node-demo-shop-api@1.0.0 test /Users/kek/node-demo-shop-api
> mocha test/**/*.js --recursive --exit



API started at port 3333
  Order test / Тест заказа
    ✓ create order / создаём заказ (159ms)
    ✓ adding position / добавляем позицию

  Product test / Тест продукта
    ✓ create product / создаём продукт "пицца "7df706d0159165f4a3f92ead2c1c299c20e2fd28""
    ✓ product update / обновляем этот продукт
    ✓ find the product / находим этот продукт
    ✓ delete product / удаляем продукт
    ✓ be sure that we really deleted the product / продукт удалён, и его уже не найти

  Тест получения списка продуктов / Loading products api test
Sun, 26 Jan 2020 22:39:11 GMT GET /api/products/list 200 4214 - 16.892 ms
    ✓ загружаем продукты / loading products (57ms)

  Тест создания заказа / Creating order test
Sun, 26 Jan 2020 22:39:11 GMT POST /api/orders/push 200 16 - 38.144 ms
    ✓ создаём заказ / creating order (61ms)
Sun, 26 Jan 2020 22:39:11 GMT POST /api/orders/push 200 49 - 0.286 ms
    ✓ проверяем серверную валидацию / check server validation


  10 passing (502ms)
  ```

## Testing frontend
TODO
