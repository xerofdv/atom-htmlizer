# fatoya soracağım sorular var...
module.exports =
  # buffer_texts: []
  activate: ->
    atom.workspaceView.command "atom-htmlizer:make-bold", => @make_bold()

  make_bold: ->
    editor = atom.workspace.getActiveEditor()
    [scope] = editor.getCursorScopes()
    selection = editor.getSelectedText()

    output = "<strong>#{selection}</strong>"

    editor.getSelection().deleteSelectedText()



    if scope.match /html/
      is_match = selection.match /<([^>]*)>(.*?)<\/\1>/
      if is_match
        ranges = editor.insertText is_match[2]
      else
        ranges = editor.insertText output


    editor.setSelectedBufferRanges ranges
