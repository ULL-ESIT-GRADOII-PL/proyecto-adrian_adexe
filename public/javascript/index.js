let editor = ace.edit("myEditor");
editor.setTheme("ace/theme/monokai");
document.getElementById('myEditor').style.fontSize='16px';

function loadFile(fileName) {
  $.ajax({
    url : fileName,
    dataType: "text",
    success : function (data) {
      editor.session.setValue(data);

      if (window.localStorage) {
        localStorage.original = data;
      }
    }
  });
};

$(document).ready(function() {
  if (window.localStorage.original) {
    editor.session.setValue(localStorage.original);
  }
  $('#calc').click(function() {

    if (window.localStorage) {
      localStorage.original = editor.getValue();
    }

    try {
      let myVar = editor.getValue();
      let result = pl0.parse(myVar);
      $('#exit').html(JSON.stringify(result,undefined,2));
    } catch (e) {
      $('#exit').html('<div class="error"><pre>\n' + JSON.stringify(e, null,4) + '\n</pre></div>');
    }
  });
});
