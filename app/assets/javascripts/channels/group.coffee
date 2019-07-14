document.addEventListener 'turbolinks:load', ->
  App.group = App.cable.subscriptions.create { channel: "GroupChannel", group_id: $('#messages').data('group_id') },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('#messages').append data['message']
      $('#scroll').scrollTop($('#scroll')[0].scrollHeight)
      # Called when there's incoming data on the websocket for this channel

    speak: (message) ->
      @perform 'speak', message: message

  $('#chat-btn').click '[data-behavior~=group_chat]', (event) ->
    App.group.speak event.target.value
    event.target.value = ''
    event.preventDefault()

  $(document).on 'keypress', '[data-behavior~=group_chat]', (event) ->
    if event.keyCode is 13 && (event.ctrlKey || event.metaKey) # return = send
      App.group.speak event.target.value
      event.target.value = ''
      event.preventDefault()
  
  