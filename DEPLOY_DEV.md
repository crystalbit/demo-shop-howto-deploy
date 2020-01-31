# How to deploy the demo shop on your desktop computer

I mean localhost and a mac/linux.
For windows you should at least edit run scripts in package.json (change `NODE_ENV=development node index` to `set NODE_ENV=development && node index` and so on).

## Preparing
You shall install:
* node.js (v10 or later),
* npm (comes with node.js),
* mysql-server.

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
        entry: 'http://localhost:3333/api/'
    },
    directories: {
        images: '/uploads/'
    }
});
```

## Import MySQL dump with products
First create a database and a user.
Then import schema and products:
```console
$ cd ~
$ mysql -u mysql_username -p database_name < demo-shop-howto-deploy/database/install.sql
```
Ready!

## Run backend
Install app dependencies and config:
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

Then run:
```console
$ npm start
```

Backend runs on 3333 port.

## Run frontend
```console
$ cd ~
$ cd react-demo-shop-front
$ npm start
```

## Conclusion
You are great. App shall have been opened in the browser automatically. Otherwice goto localhost:3000.

## Tests
Where are also tests for both frontend and backend - [look here](./TESTING.md)