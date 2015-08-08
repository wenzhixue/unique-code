{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'unique-code:convert': => @convert()
      
  deactivate: ->
    @subscriptions.dispose()

  convert: ->
    console.log 'Wordcount was toggled!'
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText('Hello, World!')
