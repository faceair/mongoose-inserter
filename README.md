mongoose-inserter
=================

A fast mongoose inserter.

### Use

Simply install it through npm

`npm install mongoose-inserter`

### Example

    mongoose = require "mongoose"
    ObjectId = require("mongoose").Types.ObjectId
    inserter = require './index'

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
            ]

### License

The MIT License (MIT)

Copyright (c) 2014 faceair

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.