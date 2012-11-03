fodder_list = new FodderList

window.fodder_list = fodder_list # Only used for debugging

addFodder = () ->
  fodder_list.append new Fodder
  id = fodder_list.lastIndex()
  jQuery('#fodder_header_table').append """
    <tr>
      <td><input type="text" class="fodder-name" id="fodder_name_#{id}" /></td>
      <td><input type="text" id="fodder_amount_#{id}" /></td>
      <td><input type="text" id="fodder_solids_#{id}" /></td>
      <td><input type="text" id="fodder_energy_#{id}" /></td>
      <td><input type="text" id="fodder_protein_#{id}" /></td>
      <td><input type="text" id="fodder_calcium_#{id}" /></td>
      <td><input type="text" id="fodder_phosphor_#{id}" /></td>
      <td><input type="text" id="fodder_magnesium_#{id}" /></td>
      <td><input type="text" id="fodder_selenium_#{id}" /></td>
      <td><div id="add_fodder">Lägg till nytt foder</div></td>
    </tr>

  """

jQuery ->
  addFodder()

  jQuery('#add_fodder').live 'click', ->
    addFodder()

  jQuery('#fodder_header_table input').live 'keyup', ->
    idString = jQuery(this).attr('id')
    [_matchData, elementName, elementId] = idString.match(/_([a-z]+)_(\d+)/)
    fodder_list.getFodderByIndex(elementId)[elementName] = jQuery("#fodder_#{elementName}_#{elementId}").val()
    totals = fodder_list.calculate()
    jQuery('#total_solids').val(totals.solids)
    jQuery('#total_energy').val(totals.energy)
    jQuery('#total_protein').val(totals.protein)
    jQuery('#total_calcium').val(totals.calcium)
    jQuery('#total_phosphor').val(totals.phosphor)
    jQuery('#total_magnesium').val(totals.magnesium)
    jQuery('#total_selenium').val(totals.selenium)