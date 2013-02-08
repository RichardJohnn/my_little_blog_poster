module.exports = (title, body) ->
  sql = require("mysql")

  database_credentials = require("./keep-it-secret-keep-it-safe")

  connection = sql.createConnection(database_credentials)
  connection.connect()

  logQuery = (err, rows, fields) ->
    throw err  if err
    console.log rows

  post = {title: title, words:body}
  connection.query("INSERT INTO `textpile` SET ?", post, logQuery)
  connection.end()