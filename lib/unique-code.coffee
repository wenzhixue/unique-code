UniqueCodeView = require './unique-code-view'
{CompositeDisposable} = require 'atom'

module.exports = UniqueCode =
  uniqueCodeView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @uniqueCodeView = new UniqueCodeView(state.uniqueCodeViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @uniqueCodeView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'unique-code:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @uniqueCodeView.destroy()

  serialize: ->
    uniqueCodeViewState: @uniqueCodeView.serialize()

  toggle: ->
    console.log 'UniqueCode was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
