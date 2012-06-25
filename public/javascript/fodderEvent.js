// Generated by CoffeeScript 1.3.1
(function() {
  var addFodder, fodder_list;

  fodder_list = new FodderList;

  window.fodder_list = fodder_list;

  addFodder = function() {
    var id;
    fodder_list.append(new Fodder);
    id = fodder_list.lastIndex();
    return jQuery('#fodder_header').append("<div class=\"fodder row\">\n  <div class=\"two columns\"><input type=\"text\" id=\"fodder_name_" + id + "\" /></div>\n  <div class=\"one column\"><input type=\"text\" id=\"fodder_solids_" + id + "\" /></div>\n  <div class=\"one column\"><input type=\"text\" id=\"fodder_energy_" + id + "\" /></div>\n  <div class=\"one column\"><input type=\"text\" id=\"fodder_protein_" + id + "\" /></div>\n  <div class=\"one column\"><input type=\"text\" id=\"fodder_calcium_" + id + "\" /></div>\n  <div class=\"one column\"><input type=\"text\" id=\"fodder_phosphor_" + id + "\" /></div>\n  <div class=\"one column\"><input type=\"text\" id=\"fodder_magnesium_" + id + "\" /></div>\n  <div class=\"one column\"><input type=\"text\" id=\"fodder_selenium_" + id + "\" /></div>\n  <div class=\"two column\" id=\"add_fodder\">Lägg till nytt foder</div>\n</div>");
  };

  jQuery(function() {
    addFodder();
    jQuery('#add_fodder').live('click', function() {
      return addFodder();
    });
    return jQuery('.fodder div input').live('keyup', function() {
      var elementId, elementName, idString, _matchData, _ref;
      idString = jQuery(this).attr('id');
      _ref = idString.match(/_([a-z]+)_(\d+)/), _matchData = _ref[0], elementName = _ref[1], elementId = _ref[2];
      return fodder_list[elementId][elementName] = jQuery("#fodder_" + elementName + "_" + elementId).val();
    });
  });

}).call(this);
