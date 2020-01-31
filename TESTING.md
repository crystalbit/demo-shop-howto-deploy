# Testing
You can easily run tests for both frontend and backend in the dev environment.

## Testing backend
Move to backend project directory and run `npm test`

There are 6 test files and 24 tests:
* `db-order.js` tests order database functions: creates an order and adds order position to it;
* `db-product.js` tests product database functions: creates, modifies and looks for a product;
* `server-list-products.js` emulates server and fetches product list via http query;
* `server-push-orders.js` emulates server and creates new order with existing api, also creates order with invalid phone to check server validation.
* `server-auth.js` emulates server and tries auth apis (registration, login, logoff).
* `server-auth-validation.js` emulates server and tries to register with some invalid data.

## Sample backend test output
```console
➜  node-demo-shop-api git:(dev) npm test

> node-demo-shop-api@1.0.0 test /Users/kek/node-demo-shop-api
> mocha test/**/*.js --recursive --exit



API started at port 3333
  Order test / Тест заказа
    ✓ create order / создаём заказ (70ms)
    ✓ adding position / добавляем позицию

  Product test / Тест продукта
    ✓ create product / создаём продукт "пицца "600a5ae79806e938de1e7fbac2c2b8fbc47b042a""
    ✓ product update / обновляем этот продукт
    ✓ find the product / находим этот продукт
    ✓ delete product / удаляем продукт
    ✓ be sure that we really deleted the product / продукт удалён, и его уже не найти

  Тест валидации при регистрации клиента / Client validation at signup test
    ✓ try wrong email (42ms)
    ✓ try wrong name
    ✓ try wrong address
    ✓ try wrong phone
    ✓ try short password
    ✓ try long password
    ✓ try password with bad symbol

  Тест регистрации клиента / Client signup test
    ✓ регистрируем / signing up (43ms)
    ✓ повторная регистрация той же почты / signing up with existing email
    ✓ проверяем, аутентифицированы ли мы / check if we are autentificated
    ✓ вход с правильным паролем / valid login
    ✓ проверяем, аутентифицированы ли мы / check if we are autentificated
    ✓ вход с неправильным паролем / invalid login
    ✓ выход / logout

  Тест получения списка продуктов / Loading products api test
    ✓ загружаем продукты / loading products

  Тест создания заказа / Creating order test
    ✓ создаём заказ / creating order
    ✓ проверяем серверную валидацию / check server validation


  24 passing (459ms)
  ```

## Testing frontend
Move to frontend project directory and run `npm test`

Press `a` if no tests were found.

There are 5 tests now:
* `App.test.js` just renders App and checks if the caption is where it should be;
* `validateClient.test.js` tests client validation (valid and invalid data - two tests);
* `Product.snapshot.test.js` compares a snapshot of Product component to rendered with sample data Product;
* `Cart-Element.snapshot.test.js` compares a snapshot of Cart/Element component to rendered with sample data Cart/Element;
* `Cart-Thumbnail.snapshot.test.js` compares a snapshot of Cart/Thumbnail component to rendered with sample data Cart/Thumbnail;

## Sample frontend test output
```console
 PASS  src/__tests__/validateClient.test.js
 PASS  src/__tests__/Cart-Element.snapshot.test.js
 PASS  src/__tests__/Cart-Thumbnail.snapshot.test.js
 PASS  src/__tests__/Product.snapshot.test.js
 PASS  src/__tests__/App.test.js

Test Suites: 5 passed, 5 total
Tests:       6 passed, 6 total
Snapshots:   3 passed, 3 total
Time:        5.423s
Ran all test suites.

Watch Usage: Press w to show more.
```
