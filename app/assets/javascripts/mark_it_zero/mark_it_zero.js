$(document).ready(function(){
  $('textarea.mark-it-zero').each(function(idx){
    new Editor({
      element: $('textarea.mark-it-zero')[idx]
    });
  });
});
