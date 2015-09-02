{CompositeDisposable} = require 'atom'

git = require './git'

module.exports = GitTabs =
  repoSubscriptions: null
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'git-tabs:toggle': => @toggle()
    # Set up git subscriptions

  deactivate: ->
    @subscriptions.dispose()

  subscribeToRepositories: ->
    @repoSubscriptions?.dispose()
    @repoSubscriptions = new CompositeDisposable

    for repo in git.getRepositories() when repo?
      @repoSubscriptions.add repo.onDidChangeStatus ({path, status}) =>
        @handleStatusChange({path, status})

  toggle: ->
    console.log 'GitTabs was toggled!'

  handleStatusChange: ({path, status}) ->
    console.log 'Status changed'
    console.log path
    console.log status
