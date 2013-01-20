
should = require 'should'
dubstep = require '../../lib/dubstep'

describe 'dubstep', ->

  NEXT_COUNTER = 0

  connect =
    req: null
    res: {}
    next: () -> NEXT_COUNTER++

  # Run the middware
  dubstep connect.req, connect.res, connect.next

  it 'should be a function that is compatible with connect middleware', ->

    dubstep.should.be.instanceof Function
    dubstep.length.should.equal 3

  describe 'middleware', ->

    it 'should define a function dub.step()', ->

      connect.res.dub.step.should.be.instanceof Function
      connect.res.dub.step.length.should.equal 1

    it 'should call next() once', ->

      NEXT_COUNTER.should.equal 1

  describe 'steps', ->

    it 'should behave like a queue (first in first out)', ->

      called = []

      connect.res.dub.step (req,res,step) ->
        called.push 'first step'
        step()

      connect.res.dub.step (req,res,step) ->
        called.push 'second step'
        step()

      connect.res.dub.step()
      called.should.eql [ 'first step', 'second step' ]

    it 'should stop when a step neglects to call the next step()', ->

      called = []

      connect.res.dub.step (req,res,step) ->
        called.push 'first step'

      connect.res.dub.step (req,res,step) ->
        called.push 'second step'

      connect.res.dub.step()
      called.should.eql [ 'first step' ]

    it 'should have access to req and res from connect', ->

      connect.res.dub.step (req,res,step) ->
        req.should.eql req
        oconnect.res.should.eql res

      connect.res.dub.step()