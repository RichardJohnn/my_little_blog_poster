###
Module dependencies.
###
express = require "express"
routes = require "./routes"
user = require "./routes/user"
http = require "http"
path = require "path"
mysql = require "./mysql"
app = express()

app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, "public"))
  app.use require('connect-assets')()

app.configure "development", ->
  app.use express.errorHandler()

app.post "/", (req, res) ->
  Body = req.param("Body")
  Title = req.param("Title")
  mysql Title, Body
  res.writeHead 200,
    "Content-Type": "text/html"
  res.write "Thank you, you are cool."
  res.end()

app.get "/", routes.index
app.get "/users", user.list
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")


