var mysql = require("mysql");
var inquirer = require("inquirer");
var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  database: "bamazon_DB"
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
  afterConnection();
});

function afterConnection() {
  connection.query("SELECT * FROM products", function (err, res) {
    if (err) throw err;
    console.log(res);
    purchase();
  });
}

function purchase() {
  inquirer.prompt([{
      type: 'input',
      name: 'item_id',
      message: 'What is the ID number of the product you would like to purchase?',
      filter: Number
    },
    {
      type: 'input',
      name: 'amount',
      message: 'How much of this product would you like to purchase?',
      filter: Number
    }
  ]).then(function (answer) {
    var itemID = answer.item_id;
    var amount = answer.amount;
    var queryStr = 'SELECT * FROM products WHERE ?';

    connection.query(queryStr, {
      item_id: itemID
    }, function (err, data) {
      if (err) throw err;

      else {
        var productData = data[0];
        if (amount <= productData.stock_quantity) {
          console.log('Great!');
          var updateQueryStr = 'UPDATE products SET stock_quantity = ' + (productData.stock_quantity - amount) + ' WHERE item_id = ' + itemID;
          connection.query(updateQueryStr, function (err, data) {
            if (err) throw err;
            console.log('Your oder has been placed. Your total is $' + productData.price * amount);
            connection.end();
          })
        } else {
          console.log('Sorry, there is not enough in stock to complete your order. Please try again.');
        }
      }
    })
  })
}