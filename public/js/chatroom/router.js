define([ 'backbone'
       , 'backbone-extensions/router-utilities'
       ],

function( Backbone 
	, RouterUtils
	){
    
  var ChatRoomRouter = Backbone.Router.extend({

    routes: { 'chatRoom'   : 'chatRoom'
	    , '*path'      : 'default'
            },

    initialize : function(chatroomView){
      this.chatRoom              = chatroomView;
    },

    run : function(){
      this.on('route:default',      function(){this.navigate('chatRoom', true);});
      this.on('route:chatRoom',     function(){RouterUtils.openView(this.chatRoom);});
      }
  });

  return ChatRoomRouter;
});
