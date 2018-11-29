App.messages = App.cable.subscriptions.create('MessagesChannel', {  
  received: function(data) {
    $("#messages").removeClass('hidden')
    $('#messages').animate({scrollTop: $('#messages').prop("scrollHeight")}, 500);

    return $('#messages').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>"+new Date().toUTCString()+"</br>" + data.message + "</p>";
  }
});