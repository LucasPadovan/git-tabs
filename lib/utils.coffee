module.exports =
  getStorageDir: ->
    return process.env.ATOM_HOME + '/git-tabs'

  getItemPath: (item) ->
    return item.buffer?.file?.path

  getActiveItemPath: ->
    editor = atom.workspace.getActivePane()
    return editor?.buffer.file
