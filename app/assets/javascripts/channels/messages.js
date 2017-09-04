App.messages = App.cable.subscriptions.create('MessagesChannel', {
  connected: function (data){
    alert('connected')
  },
  received: function(data) {
  location.reload()
  }
});
