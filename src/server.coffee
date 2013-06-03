# let's start with a simple server that logs all the requests
express = require "express"
expressWinston = require "express-winston"
winston = require "winston"
evalCf = require("exec.js").evalCf

app = express()
app.use expressWinston.logger
    transports: [
        new winston.transports.Console
            colorize: true
            timestamp: true
    ]

app.get '/', (req, res) ->
    res.send "alive and kicking"

app.get '/evalCf', (req, res) ->
    evalCf req.query.f, JSON.parse(req.query.params), (value) ->
        res.send value

app.listen 8080
