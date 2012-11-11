// Generated by CoffeeScript 1.3.1
(function() {
  var Need, root;

  Need = (function() {

    Need.name = 'Need';

    function Need(horse) {
      this.horse = horse;
    }

    Need.prototype.__round = function(value) {
      return Math.round(value * 100) / 100;
    };

    Need.prototype.workEnergyInMJ = function() {
      var trotEnergy, walkEnergy;
      walkEnergy = (this.horse.workload['walk'] / 10) * 0.2 * (this.horse.weight / 100);
      trotEnergy = (this.horse.workload['trot'] / 10) * 1.3 * (this.horse.weight / 100);
      return (walkEnergy + trotEnergy) * (this.horse.workload['daysPerWeek'] / 7);
    };

    Need.prototype.baseEnergyInMJ = function() {
      var feedTypeFactor, genderFactor;
      feedTypeFactor = genderFactor = 1.00;
      switch (this.horse.feedType) {
        case 'normal':
          feedTypeFactor = 1.05;
          break;
        case 'hard':
          feedTypeFactor = 1.10;
      }
      if (this.horse.gender === 'stallion') {
        genderFactor = 1.10;
      }
      return 0.5 * Math.pow(this.horse.weight, 0.75) * feedTypeFactor * genderFactor;
    };

    Need.prototype.workBaseEnergyRatio = function() {
      return this.workEnergyInMJ() / this.baseEnergyInMJ();
    };

    Need.prototype.energyInMJ = function() {
      return this.__round(this.baseEnergyInMJ() + this.workEnergyInMJ());
    };

    Need.prototype.proteinInGrams = function() {
      return this.__round(this.energyInMJ() * 6);
    };

    Need.prototype.__macroMineralNeed = function(mineralNeeds) {
      var factor, ratio;
      ratio = this.workBaseEnergyRatio();
      if (ratio === 0) {
        return factor = mineralNeeds[0];
      } else if (ratio < 0.30) {
        return factor = mineralNeeds[1];
      } else if (ratio < 0.50) {
        return factor = mineralNeeds[2];
      } else {
        return factor = mineralNeeds[3];
      }
    };

    Need.prototype.__sufficientMacroMineral = function(mineral, mineral_need) {
      return (mineral_need <= mineral && mineral <= (1.5 * mineral_need));
    };

    Need.prototype.calciumInGrams = function() {
      return this.__round((this.horse.weight / 100) * this.__macroMineralNeed([4.0, 6.0, 7.0, 8.0]));
    };

    Need.prototype.phosphorInGrams = function() {
      return this.__round((this.horse.weight / 100) * this.__macroMineralNeed([2.8, 3.6, 4.2, 5.8]));
    };

    Need.prototype.magnesiumInGrams = function() {
      return this.__round((this.horse.weight / 100) * this.__macroMineralNeed([1.5, 1.9, 2.3, 3.0]));
    };

    Need.prototype.seleniumInMilligrams = function() {
      return this.__round((this.horse.weight / 100) * 0.2);
    };

    Need.prototype.solidsInKilos = function() {
      return this.__round((this.horse.weight / 100) * 1.5);
    };

    Need.prototype.sufficentEnergy = function(energy) {
      return ((this.energyInMJ() - 3) <= energy && energy <= (this.energyInMJ() + 3));
    };

    Need.prototype.sufficentProtein = function(protein) {
      return ((0.9 * this.proteinInGrams()) <= protein && protein <= (1.1 * this.proteinInGrams()));
    };

    Need.prototype.suffientCalcium = function(calcium) {
      return this.__sufficientMacroMineral(calcium, this.calciumInGrams());
    };

    Need.prototype.suffientPhosphor = function(phosphor) {
      return this.__sufficientMacroMineral(phosphor, this.phosphorInGrams());
    };

    Need.prototype.suffientMagnesium = function(magnesium) {
      return this.__sufficientMacroMineral(magnesium, this.magnesiumInGrams());
    };

    return Need;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  root.Need = Need;

}).call(this);
