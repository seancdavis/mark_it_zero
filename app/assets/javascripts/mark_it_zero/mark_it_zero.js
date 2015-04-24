//= require jquery
//= require mark_it_zero/editor
//= require mark_it_zero/marked

$(document).ready(function(){
  $('textarea.mark-it-zero').each(function(idx){
    new Editor({
      element: $('textarea.mark-it-zero')[idx]
    });
  });
});
