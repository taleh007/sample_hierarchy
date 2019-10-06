const renderService = (() => {
  const service = {
    siteMap: (json) => {
      var result = $('<ul>');

      json.data.forEach((root) => {
        result.append(service.renderNode(root));
      });

      return result;
    },
    renderNode: (node) => {
      var result = $('<li>').append(service.renderLink(node));

      result.append(service.renderChildren(node));

      return result;
    },

    renderLink: (node) => {
      var href = node.absolute_path === "" ? '/' : node.absolute_path;

      return $('<a>').attr('href', href).text(node.name).attr('id', node.view_id);
    },
    renderChildren: (node) => {
      if (node.leaf) return '';

      var list = $('<ul>');

      node.children.forEach((child) => {
        list.append(service.renderNode(child));
      });

      return list;
    }
  };

  return service;
})();

$.ajax({
  url: '/site_map',
  success: (json) => {
    $('#site_map_view').empty().append(renderService.siteMap(json));
  }
});
