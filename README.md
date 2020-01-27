# Demo Shop

Hi! This is the demo shop.
It consists of frontend and backend parts in separate repositories.

# Some information:
* Frontend is written in React with Material UI using create-react-app and jest for tests.
* Backend is written on Node.JS with express.js framework, passport.js for authorisation, Sequelize ORM for MySQL connection and Mocha+Chai for tests.
* The project uses a MySQL database.
* It is ready for using with nginx in production.
* And can be easily run on localhost without nginx with a full functionality.

Project is deployed here: http://5.101.116.39/

Feel free to make any orders and register with any random mail (no letters and confirmations and no managers to call you and offer pizza :) )

But the server will be online till 22.02.2020 unless I decide to prolong it.

## INSTRUCTIONS

Please, visit these links:

* How to [install on localhost](./DEPLOY_DEV.md) (dev environment)
* How to [install on server](./DEPLOY_ON_SERVER.md) (VPS, production environment)
* How to [run tests for backend and frontend](./TESTING.md)

## Repositories:

The project contains of three repositories:

* Frontend (react): https://github.com/crystalbit/react-demo-shop-front
* Backend (node.js): https://github.com/crystalbit/node-demo-shop-api
* also you will need the current repository: https://github.com/crystalbit/demo-shop-howto-deploy

## MySQL dump and images

There are also mysql dump and images in the repo. To properly install them please see [DEV](./DEPLOY_DEV.md) or [PROD](./DEPLOY_ON_SERVER.md) instruction.
