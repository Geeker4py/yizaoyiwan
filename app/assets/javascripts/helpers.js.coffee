@withActions = (actions, callback) ->
  selectors = actions.split(/\s+/).map (action) -> ".action_#{action}"
  if $('body').is(selectors.join(', '))
    classList = Array.create(document.body.classList)
    currentAction = classList.find(/^action_/i).replace(/^action_/i, '')
    callback(currentAction)