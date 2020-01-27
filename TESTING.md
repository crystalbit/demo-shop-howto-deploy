# Testing
You can easily run tests for both frontend and backend in the dev environment.

## Testing backend
Move to backend project directory and run `npm test`

There are 4 tests now:
* `db-order.js` tests order database functions: creates an order and adds order position to it;
* `db-product.js` tests product database functions: creates, modifies and looks for a product;
* `server-list-products.js` emulates server and fetches product list via http query;
* `server-push-orders.js` emulates server and creates new order with existing api, also creates order with invalid phone to check server validation.

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
Move to frontend project directory and run `npm test`

Press `a` if no tests were found.

There are 6 tests now:
* `App.test.js` just renders App and checks if the caption is where it should be;
* `validateClient.test.js` tests client validation (valid and invalid data - two tests);
* `Header.snapshot.test.js` compares a snapshot of Header component to rendered Header;
* `Product.snapshot.test.js` compares a snapshot of Product component to rendered with sample data Product;
* `Cart-Element.snapshot.test.js` compares a snapshot of Cart/Element component to rendered with sample data Cart/Element;
* `Cart-Thumbnail.snapshot.test.js` compares a snapshot of Cart/Thumbnail component to rendered with sample data Cart/Thumbnail;

## Sample frontend test output
```console
 PASS  src/__tests__/Cart-Thumbnail.snapshot.test.js
 PASS  src/__tests__/Cart-Element.snapshot.test.js
 PASS  src/__tests__/Product.snapshot.test.js
 PASS  src/__tests__/App.test.js
 PASS  src/__tests__/Header.snapshot.test.js
 PASS  src/__tests__/validateClient.test.js

Test Suites: 6 passed, 6 total
Tests:       7 passed, 7 total
Snapshots:   4 passed, 4 total
Time:        5.554s, estimated 7s
Ran all test suites.

Watch Usage: Press w to show more.
```
