var editor = ace.edit("myEditor");
//editor.setTheme("src-min/theme-github.js");
editor.setTheme("ace/theme/monokai");
//editor.session.setValue($("#my_html_hidden").text());

function loadFile(fileName) {
  $.ajax({
    url : fileName,
    dataType: "text",
    success : function (data) {
      editor.session.setValue(data);

      if (window.localStorage) {localStorage.original = data;}
      }
  });
};
