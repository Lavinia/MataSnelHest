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
  colourFor(need.sufficentEnergy(totals.energy), '#total_energy')
  colourFor(need.sufficentProtein(totals.protein), '#total_protein')
  colourFor(need.suffientCalcium(totals.calcium), '#total_calcium')
  colourFor(need.suffientPhosphor(totals.phosphor), '#total_phosphor')
  colourFor(need.suffientMagnesium(totals.magnesium), '#total_magnesium')
  colourFor(need.sufficientSelenium(totals.selenium), '#total_selenium')

addGreen = (htmlElement) ->
  jQuery(htmlElement).removeClass('red')
  jQuery(htmlElement).addClass('green')

addRed = (htmlElement) ->
  jQuery(htmlElement).removeClass('green')
  jQuery(htmlElement).addClass('red')

colourFor = (sufficientNutrient, htmlElement) ->
  if sufficientNutrient then addGreen(htmlElement) else addRed(htmlElement)

addQoutients = (htmlElement, nutrientToDivide, nutrientToDivideBy) ->
  jQuery(htmlElement).html(fodder_list.calculateQuotient(nutrientToDivide, nutrientToDivideBy))

addSumsAndQuotients = (totals) ->
  jQuery('#total_solids').html(round(totals.solids))
  jQuery('#total_energy').html(round(totals.energy))
  jQuery('#total_protein').html(round(totals.protein))
  jQuery('#total_calcium').html(round(totals.calcium))
  jQuery('#total_phosphor').html(round(totals.phosphor))
  jQuery('#total_magnesium').html(round(totals.magnesium))
  jQuery('#total_selenium').html(round(totals.selenium))

  addQoutients('#MJSmrp-quotient span', totals.protein, totals.energy)
  addQoutients('#CaP-quotient span', totals.calcium, totals.phosphor)
  addQoutients('#CaMg-quotient span', totals.calcium, totals.magnesium)

  colourizeResults(totals)

String::capitalize = ->
  this.substr(0, 1).toUpperCase() + this.substr(1)

setFodders = (elementName, elementId) ->
  nutrient = elementName.capitalize()
  eval("fodder_list.getFodderByIndex(elementId).set" + nutrient + "(jQuery('#fodder_#{elementName}_#{elementId}').val())")

jQuery ->
  addFodder()

  jQuery('#add_fodder').live 'click', ->
    addFodder()

  jQuery('#fodder_header_table input').live 'keyup', ->
    idString = jQuery(this).attr('id')
    [_matchData, elementName, elementId] = idString.match(/_([a-z]+)_(\d+)/)
    try
      setFodders(elementName, elementId)
      jQuery('.fodder_error').html ''
    catch err
      jQuery('.fodder_error').html err.message

    addSumsAndQuotients fodder_list.calculate()








