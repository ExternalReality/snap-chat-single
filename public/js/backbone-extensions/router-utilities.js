define ([ 'backbone'
        ],

function (Backbone, Rx) {

  var replaceContentWith = function(view) {
        var content = $('#content');
        var node    = view.render().el;
        replaceOrAppend(content, node);
  };

  function openView(view){
    replaceContentWith(view);
    var fn = view.open;
    callIfDefined(fn);
  }

  return { replaceContentWith : replaceContentWith,
           openView           : openView
         };

});

function replaceOrAppend(content, replacement) {
  var innerContent   = content.children();
  var contentIsEmpty = innerContent.size() === 0;

  if (contentIsEmpty) {
    content.append(replacement);
  }else{
    innerContent.replaceWith(replacement);
  }
}

function isFunctionDefined(callback) {
 return typeof(callback) == typeof(Function);
}

function callIfDefined(callback) {
  if (isFunctionDefined(callback)){
    callback();
  }
}
