// Generated by CoffeeScript 1.3.1
(function() {
  var addFodder, calculateCalciumPhosphorQoutient, fodder_list;

  fodder_list = new FodderList;

  window.fodder_list = fodder_list;

  addFodder = function() {
    var id;
    fodder_list.append(new Fodder);
    id = fodder_list.lastIndex();
    return jQuery('#fodder_header_table').append("<tr>\n  <td><input type=\"text\" class=\"fodder-name\" id=\"fodder_name_" + id + "\" /></td>\n  <td><input type=\"text\" id=\"fodder_amount_" + id + "\" /></td>\n  <td><input type=\"text\" id=\"fodder_solids_" + id + "\" /></td>\n  <td><input type=\"text\" id=\"fodder_energy_" + id + "\" /></td>\n  <td><input type=\"text\" id=\"fodder_protein_" + id + "\" /></td>\n  <td><input type=\"text\" id=\"fodder_calcium_" + id + "\" /></td>\n  <td><input type=\"text\" id=\"fodder_phosphor_" + id + "\" /></td>\n  <td><input type=\"text\" id=\"fodder_magnesium_" + id + "\" /></td>\n  <td><input type=\"text\" id=\"fodder_selenium_" + id + "\" /></td>\n  <td><div id=\"add_fodder\">Lägg till nytt foder</div></td>\n</tr>\n");
  };

  calculateCalciumPhosphorQoutient = function(totals) {
    var CaPQuotient;
    CaPQuotient = totals.calcium / totals.phosphor;
    return jQuery('#CaP-quotient span').html(CaPQuotient);
  };

  jQuery(function() {
    addFodder();
    jQuery('#add_fodder').live('click', function() {
      return addFodder();
    });
    return jQuery('#fodder_header_table input').live('keyup', function() {
      var elementId, elementName, idString, totals, _matchData, _ref;
      idString = jQuery(this).attr('id');
      _ref = idString.match(/_([a-z]+)_(\d+)/), _matchData = _ref[0], elementName = _ref[1], elementId = _ref[2];
      fodder_list.getFodderByIndex(elementId)[elementName] = jQuery("#fodder_" + elementName + "_" + elementId).val();
      totals = fodder_list.calculate();
      jQuery('#total_solids').html(totals.solids);
      jQuery('#total_energy').html(totals.energy);
      jQuery('#total_protein').html(totals.protein);
      jQuery('#total_calcium').html(totals.calcium);
      jQuery('#total_phosphor').html(totals.phosphor);
      jQuery('#total_magnesium').html(totals.magnesium);
      jQuery('#total_selenium').html(totals.selenium);
      jQuery('#MJSmrp-quotient span').html(fodder_list.calculateQoutient(totals.protein, totals.energy));
      return jQuery('#CaP-quotient span').html(fodder_list.calculateQoutient(totals.calcium, totals.phosphor));
    });
  });

}).call(this);
