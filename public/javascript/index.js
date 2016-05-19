YUI().use(
  'aui-ace-editor',
  function(ed) {

  }
);

YUI().use(
  'aui-ace-editor',
  function(ed) {
    new ed.AceEditor(
      {
        boundingBox: '#myEditor',
        //mode: 'javascript'
      }
    ).render();
  }
);
