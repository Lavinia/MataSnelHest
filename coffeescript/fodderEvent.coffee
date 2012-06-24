fodder_list = new FodderList
fodder_list.append new Fodder

window.fodder_list = fodder_list # Only used for debugging

jQuery ->
  jQuery('#add_fodder').live 'click', ->
    fodder_list.append new Fodder
    jQuery('#fodder_header').append """
      <div class="fodder row">
        <div class="two columns"><input type="text" id="fodder_name_#{fodder_list.lastIndex()}" /></div>
        <div class="one column"><input type="text" id="fodder_solids" /></div>
        <div class="one column"><input type="text" id="fodder_energy" /></div>
        <div class="one column"><input type="text" id="fodder_protein" /></div>
        <div class="one column"><input type="text" id="fodder_calcium" /></div>
        <div class="one column"><input type="text" id="fodder_phosphor" /></div>
        <div class="one column"><input type="text" id="fodder_magnesium" /></div>
        <div class="one column"><input type="text" id="fodder_selenium" /></div>
        <div class="two column" id="add_fodder">Lägg till nytt foder</div>
      </div>
    """