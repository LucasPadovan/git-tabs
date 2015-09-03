# Where git is interfaced
module.exports =
  hasGit: ->
    return atom.project.getRepositories().length > 0

  getMainRepo: ->
    if @hasGit()
      return atom.project.getRepositories()[0]
    else
      return null

  getBranch: ->
    console.log 'i am here :^)'
    if @hasGit()
      return @getMainRepo().getShortHead()
    else
      return null

  getRepositories: ->
    return atom.project.getRepositories()
