fodder_list = new FodderList

window.fodder_list = fodder_list # Only used for debugging

round = (value) ->
    Math.round(value * 100) / 100

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

colourizeResults = (totals) ->
  needFulfilledColour(need.sufficentEnergy(totals.energy), '#total_energy')
  needFulfilledColour(need.sufficentProtein(totals.protein), '#total_protein')
  needFulfilledColour(need.suffientCalcium(totals.calcium), '#total_calcium')
  needFulfilledColour(need.suffientPhosphor(totals.phosphor), '#total_phosphor')
  needFulfilledColour(need.suffientMagnesium(totals.magnesium), '#total_magnesium')
  needFulfilledColour(need.sufficientSelenium(totals.selenium), '#total_selenium')

needFulfilledColour = (method, htmlElement) ->
  if method
    jQuery(htmlElement).removeClass('red')
    jQuery(htmlElement).addClass('green')
  else
    jQuery(htmlElement).removeClass('green')
    jQuery(htmlElement).addClass('red')

addQoutients = (htmlElement, totals) ->
  jQuery(htmlElement).html(fodder_list.calculateQuotient(totals.protein, totals.energy))
  jQuery(htmlElement).html(fodder_list.calculateQuotient(totals.calcium, totals.phosphor))

addSumsAndQuotients = (totals) ->
  jQuery('#total_solids').html(round(totals.solids))
  jQuery('#total_energy').html(round(totals.energy))
  jQuery('#total_protein').html(round(totals.protein))
  jQuery('#total_calcium').html(round(totals.calcium))
  jQuery('#total_phosphor').html(round(totals.phosphor))
  jQuery('#total_magnesium').html(round(totals.magnesium))
  jQuery('#total_selenium').html(round(totals.selenium))

  addQoutients('#MJSmrp-quotient span', totals)
  addQoutients('#CaP-quotient span', totals)

  colourizeResults(totals)

jQuery ->
  addFodder()

  jQuery('#add_fodder').live 'click', ->
    addFodder()

  jQuery('#fodder_header_table input').live 'keyup', ->
    idString = jQuery(this).attr('id')
    [_matchData, elementName, elementId] = idString.match(/_([a-z]+)_(\d+)/)
    fodder_list.getFodderByIndex(elementId)[elementName] = jQuery("#fodder_#{elementName}_#{elementId}").val()
    addSumsAndQuotients fodder_list.calculate()
