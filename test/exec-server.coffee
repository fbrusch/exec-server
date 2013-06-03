assert = require "assert"
request = require "request"
logger = require "../src/log.coffee"

address = "http://localhost:8080/"

describe "ladies and gentlemen", ->
    describe "some deepest truth", ->
        it "should be that rose is a rose (is a rose)", ->
            assert.equal "rose","rose"

describe "exec-server", ->

    describe "server", ->
        it "should answer something on /", (done) ->
            request address, (err, resp, body) ->
                logger.log "response:" + resp
                assert.equal resp.statusCode, 200
                done()

    describe "function evaulation", ->
        f = "int f(){return 42;}"

        it f + "should return 42", (done) ->
            request.get({
                url: "http://localhost:8080/evalCf",
                qs:
                    f: f
                    params: JSON.stringify([])},
                (e, r, body) ->
                    assert.equal body,"42"
                    done()
            )

        f2 = "int f(int a, int b){return a+b;}"

        it f + "should return 2 if provided with parms 1,2]", (done) ->
            request.get
                url: address + "evalCf",
                qs:
                    f: f2
                    params: JSON.stringify [1,1],
                (e, r, body) ->
                    assert.equal body,"2"
                    done()

