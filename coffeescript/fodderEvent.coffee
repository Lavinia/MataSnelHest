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
addTotalAmount = () ->
  console.log 'dog'


jQuery ->
  #adds total amount of fodders in the sum part.
  addTotalAmount()

  addFodder()

  jQuery('#add_fodder').live 'click', ->
    addFodder()

  jQuery('.fodder div input').live 'keyup', ->
    idString = jQuery(this).attr('id')
    [_matchData, elementName, elementId] = idString.match(/_([a-z]+)_(\d+)/)
    fodder_list.getFodderByIndex(elementId)[elementName] = jQuery("#fodder_#{elementName}_#{elementId}").val()
    totals = fodder_list.calculate()
    jQuery('#total_solids').val(totals.solids)
