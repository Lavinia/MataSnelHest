// Generated by CoffeeScript 1.3.1
(function() {
  var gram, horse, need, printNeeds;

  horse = new Horse;

  need = new Need(horse);

  gram = ' gram';

  printNeeds = function() {
    jQuery('#needSolids').html(need.solidsInKilos() + ' kilo');
    jQuery('#needEnergy').html(need.energyInMJ() + ' MJ');
    jQuery('#needProtein').html(need.proteinInGrams() + gram);
    jQuery('#needCalcium').html(need.calciumInGrams() + gram);
    jQuery('#needPhosphor').html(need.phosphorInGrams() + gram);
    jQuery('#needMagnesium').html(need.magnesiumInGrams() + gram);
    return jQuery('#needSelenium').html(need.seleniumInMilligrams() + ' milligram');
  };

  jQuery(function() {
    jQuery('#weight').keyup(function() {
      horse.setWeight(jQuery(this).val());
      return printNeeds();
    });
    jQuery('input[name=gender]:radio').change(function() {
      horse.setGender(jQuery(this).val());
      return printNeeds();
    });
    jQuery('input[name=feedType]:radio').change(function() {
      horse.setFeedType(jQuery(this).val());
      return printNeeds();
    });
    jQuery('#horseInfo').submit(function() {
      return false;
    });
    jQuery('#days-per-week').change(function() {
      horse.setWorkload('daysPerWeek', jQuery(this).val());
      return printNeeds();
    });
    jQuery('#walk').keyup(function() {
      horse.setWorkload('walk', jQuery(this).val());
      return printNeeds();
    });
    return jQuery('#trot').keyup(function() {
      horse.setWorkload('trot', jQuery(this).val());
      return printNeeds();
    });
  });

}).call(this);
