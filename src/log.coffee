winston = require "winston"
logger = new winston.Logger
    transports: [
        new winston.transports.Console
            timestamp: true
    ]

module.exports = logger
