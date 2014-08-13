mongoose = require "mongoose"
ObjectId = require("mongoose").Types.ObjectId
inserter = require '../index'

AppSchema = new mongoose.Schema
  app_id:
    type: String
    index:
      unique: true
  create_at: Date
, { versionKey: false }

AccountModel = mongoose.model "app", AppSchema

mongoose.connect "mongodb://localhost:27017/test", (err)->
  throw err if err
  inserter.reset AccountModel, [
      app_id: "app",
      create_at: new Date()
    ], (err)->
      throw err if err
      inserter.insert AccountModel, [
          app_id: "app",
          create_at: new Date()
        ], (err)->
          throw err if err