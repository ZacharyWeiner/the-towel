App.messages = App.cable.subscriptions.create('MessagesChannel', {
  received: function(data) {
  location.reload()
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});
