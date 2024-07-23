exports.activate = function () {
  atom.grammars.addInjectionPoint('text.html.gotmpl', {
    type: 'template',
    language() {
      return 'html';
    },
    content(node) {
      return node.descendantsOfType('text');
    }
  });
};

exports.consumeHyperlinkInjection = (hyperlink) => {
  hyperlink.addInjectionPoint('text.html.gotmpl', {
    types: ['comment']
  });
};

exports.consumeTodoInjection = (todo) => {
  todo.addInjectionPoint('text.html.gotmpl', { types: ['comment'] });
};
