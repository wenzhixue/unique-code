{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'unique-code:getcode': => @getcode()

  deactivate: ->
    @subscriptions.dispose()

  getcode: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText(@guid())

  guid: ->
    s4= ->
      Math.floor((1 + Math.random()) * 0x10000).toString(16).substring 1
    s4() + s4()
