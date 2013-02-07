module.exports = -> 
  sql = require("mysql")

  database_credentials = require("./keep-it-secret-keep-it-safe")

  connection = sql.createConnection(database_credentials)
  connection.connect()

  logQuery = (err, rows, fields) ->
    throw err  if err
    console.log rows

  getNewId = (variable) ->
    connection.query "SELECT MAX(id) + 1 as newId FROM `textpile`", (err, rows, fields) ->
      return null  if err
      console.log(rows[0].newId);
      exports.data = rows[0].newId

  # console.log getNewId()

  # var post  = {id: getNewId(), title: 'Hello MySQL'};
  # var insert = "INSERT INTO `textpile` ?", post, logQuery);

  myQuery = "SELECT id, title FROM `textpile` LIMIT 0 , 30"
  connection.query(myQuery, logQuery)

  connection.end()