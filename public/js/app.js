define([ 'backbone',
         'chatroom/view',
         'chatroom/router'
       ],

function( Backbone, 
          ChatroomView,
          ChatroomRouter 
        ){

  chatroomView   = new ChatroomView();
  chatroomRouter = new ChatroomRouter(chatroomView);
  
  var initialize = function(){
    runRouters();
    Backbone.history.start();
  };

  var runRouters = function(){
    chatroomRouter.run();
  };

  return { initialize: initialize };
});
