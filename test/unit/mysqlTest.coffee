expect = require("chai").expect
sinon = require("sinon")

@subject = require("../../mysql")()

console.log @subject

describe "MySql", ->
  before ->
    @connection = {
      connect : ->,
      query : ->
    }

  describe "responds to", ->
    it "logQuery", ->
      expect(@subject).to.respondTo("logQuery")


    #   @db = {
    #     collection: (col) -> ,
    #     update: (id, area, upsert, errCallback) ->
    #   }
    #   @dbMock = sinon.mock(@db)
    #   @dbMock.expects("collection").returns(@db).thrice()
    #   @dbMock.expects("update").thrice()

    #   @subject = new FacsTreeLog("mongodb://localhost:27017/eQuality")
    #   @subject.db = @db

    # it "for each area in the data updates mongodb", ->
    #   @subject.saveTree([{id: 1},{id: 2},{id: 3}])
    #   @dbMock.verify()