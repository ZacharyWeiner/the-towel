App.messages = App.cable.subscriptions.create('MessagesChannel', {
  connected: function (data){

  },
  received: function(data) {
  location.reload()
  }
});
