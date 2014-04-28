# fatoya soracağım sorular var...
module.exports =
  # buffer_texts: []
  activate: ->
    atom.workspaceView.command "atom-htmlizer:make-bold", => @make_bold()

  make_bold: ->
    editor = atom.workspace.getActiveEditor()
    [scope] = editor.getCursorScopes()
    selection = editor.getSelectedText()

    # @buffer_texts.push selection

    output = "<strong>#{selection}</strong>"

    # console.log "buffer", @buffer_texts

    editor.getSelection().deleteSelectedText()



    if scope.match /html/
      ranges = editor.insertText output
    editor.setSelectedBufferRanges ranges


# AtomHtmlizerView = require './atom-htmlizer-view'
#
# module.exports =
#   atomHtmlizerView: null
#
#   activate: (state) ->
#     @atomHtmlizerView = new AtomHtmlizerView(state.atomHtmlizerViewState)
#
#   deactivate: ->
#     @atomHtmlizerView.destroy()
#
#   serialize: ->
#     atomHtmlizerViewState: @atomHtmlizerView.serialize()
