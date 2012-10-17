fodder_list = new FodderList

window.fodder_list = fodder_list # Only used for debugging

addFodder = () ->
  fodder_list.append new Fodder
  id = fodder_list.lastIndex()
  jQuery('#fodder_header').append """
    <div class="fodder row">
      <div class="two columns"><input type="text" id="fodder_name_#{id}" /></div>
      <div class="one column"><input type="text" id="fodder_amount_#{id}" /></div>
      <div class="one column"><input type="text" id="fodder_solids_#{id}" /></div>
      <div class="one column"><input type="text" id="fodder_energy_#{id}" /></div>
      <div class="one column"><input type="text" id="fodder_protein_#{id}" /></div>
      <div class="one column"><input type="text" id="fodder_calcium_#{id}" /></div>
      <div class="one column"><input type="text" id="fodder_phosphor_#{id}" /></div>
      <div class="one column"><input type="text" id="fodder_magnesium_#{id}" /></div>
      <div class="one column"><input type="text" id="fodder_selenium_#{id}" /></div>
      <div class="two column" id="add_fodder">Lägg till nytt foder</div>
    </div>
  """

jQuery ->

  # TODO:
  #this need refactoring:
  # 1. make it work for different nutritions. V
  # 2. make it update when changing ANY row, not only amount.
  # 3. make it work with more fodders. # use idString


  jQuery("#fodder_amount_0").live 'keyup', ->
    nutrion_array = ['solids', 'energy', 'protein', 'calcium', 'phosphor', 'magnesium', 'selenium']
    idString = jQuery(this).attr('id')
    [_matchData, elementName, elementId] = idString.match(/_([a-z]+)_(\d+)/)
    amount = jQuery(this).val()

    for nutrition in nutrion_array
      nutrient = jQuery("#fodder_#{nutrition}_0").val()
      jQuery("#total_#{nutrition}").val(nutrient * amount)

  addFodder()

  jQuery('#add_fodder').live 'click', ->
    addFodder()

  jQuery('.fodder div input').live 'keyup', ->
    idString = jQuery(this).attr('id')
    [_matchData, elementName, elementId] = idString.match(/_([a-z]+)_(\d+)/)
    fodder_list[elementId][elementName] = jQuery("#fodder_#{elementName}_#{elementId}").val()
