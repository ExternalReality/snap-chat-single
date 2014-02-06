define([ 'backbone',
         'text!/../templates/chatroom.html',
         'backbone-extensions/view-extensions'
       ],

function( Backbone,
          ChatroomTemplate
        ){

  var ChatroomView = Backbone.View.extend({

    initialize : function() {
      this.open = _.bind(this.open, this);
    },

    open : function(){
    },
    
    render: function() {
      this.renderTemplate(ChatroomTemplate, {});
      return this;
    }   
  });

  return ChatroomView;
});
