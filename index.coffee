async = require "async"
_ = require "underscore"

exports.reset = (Model, docArr, cb)->
  if _.isFunction docArr
    cb = docArr
    docArr = []
  else
    unless _.isArray docArr
      docArr = [ docArr ]

  Model.remove (err)->
    cb err if err
    async.each docArr, (doc, callback)->
      new Model(doc).save (err)->
        return cb err if err and cb
        callback()
    , ->
      return cb false if cb

exports.insert = (Model, docArr, cb)->
  if _.isFunction docArr
    cb = docArr
    docArr = []
  else
    unless _.isArray docArr
      docArr = [ docArr ]

  async.each docArr, (doc, callback)->
    new Model(doc).save (err)->
      return cb err if err and cb
      callback()
  , ->
    return cb false if cb
