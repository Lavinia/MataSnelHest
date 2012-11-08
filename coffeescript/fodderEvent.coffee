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

calculateCalciumPhosphorQoutient = (totals) ->
  CaPQuotient = (totals.calcium / totals.phosphor)
  jQuery('#CaP-quotient span').html(CaPQuotient)


jQuery ->
  addFodder()

  jQuery('#add_fodder').live 'click', ->
    addFodder()

  jQuery('#fodder_header_table input').live 'keyup', ->
    idString = jQuery(this).attr('id')
    [_matchData, elementName, elementId] = idString.match(/_([a-z]+)_(\d+)/)
    fodder_list.getFodderByIndex(elementId)[elementName] = jQuery("#fodder_#{elementName}_#{elementId}").val()
    totals = fodder_list.calculate()
    jQuery('#total_solids').html(totals.solids)
    jQuery('#total_energy').html(totals.energy)
    jQuery('#total_protein').html(totals.protein)
    jQuery('#total_calcium').html(totals.calcium)
    jQuery('#total_phosphor').html(totals.phosphor)
    jQuery('#total_magnesium').html(totals.magnesium)
    jQuery('#total_selenium').html(totals.selenium)

    jQuery('#MJSmrp-quotient span').html(fodder_list.calculateQoutient(totals.protein, totals.energy))
    jQuery('#CaP-quotient span').html(fodder_list.calculateQoutient(totals.calcium, totals.phosphor))
