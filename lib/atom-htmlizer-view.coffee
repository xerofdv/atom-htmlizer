{View} = require 'atom'

module.exports =
class AtomHtmlizerView extends View
  @content: ->
    @div class: 'atom-htmlizer overlay from-top', =>
      @div "The AtomHtmlizer package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "atom-htmlizer:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "AtomHtmlizerView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
