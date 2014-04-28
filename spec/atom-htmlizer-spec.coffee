{WorkspaceView} = require 'atom'
AtomHtmlizer = require '../lib/atom-htmlizer'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomHtmlizer", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('atom-htmlizer')

  describe "when the atom-htmlizer:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.atom-htmlizer')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'atom-htmlizer:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.atom-htmlizer')).toExist()
        atom.workspaceView.trigger 'atom-htmlizer:toggle'
        expect(atom.workspaceView.find('.atom-htmlizer')).not.toExist()
