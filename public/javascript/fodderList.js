// Generated by CoffeeScript 1.3.1
(function() {
  var FodderList, root;

  FodderList = (function() {

    FodderList.name = 'FodderList';

    function FodderList() {
      this._fodders = [];
      this._nextId = -1;
    }

    FodderList.prototype.append = function(element) {
      var id;
      id = this.nextId();
      return this._fodders[id] = element;
    };

    FodderList.prototype.nextId = function() {
      return this._nextId = this._nextId + 1;
    };

    FodderList.prototype.lastIndex = function() {
      return this._nextId;
    };

    FodderList.prototype.getFodderByIndex = function(index) {
      return this._fodders[index];
    };

    FodderList.prototype.calculateQuotient = function(nutrient_nominator, nutrient_denominator) {
      if (!(nutrient_nominator && nutrient_denominator)) {
        return "";
      } else {
        return Math.round((nutrient_nominator / nutrient_denominator) * 10) / 10;
      }
    };

    FodderList.prototype.calculate = function() {
      var fodder, solids_in_kilos, totals, _i, _len, _ref;
      totals = {
        energy: 0,
        solids: 0,
        protein: 0,
        calcium: 0,
        phosphor: 0,
        magnesium: 0,
        selenium: 0
      };
      _ref = this._fodders;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        fodder = _ref[_i];
        solids_in_kilos = (fodder.solids / 100) * fodder.amount;
        totals.solids += solids_in_kilos;
        totals.energy += fodder.energy * fodder.amount;
        totals.protein += fodder.protein * fodder.amount;
        totals.calcium += fodder.calcium * fodder.amount;
        totals.phosphor += fodder.phosphor * fodder.amount;
        totals.magnesium += fodder.magnesium * fodder.amount;
        totals.selenium += fodder.selenium * fodder.amount;
      }
      return totals;
    };

    FodderList.prototype.__sufficientQuotient = function(nominator, denominator, minimum_qoute) {
      if (nominator / denominator >= minimum_qoute) {
        return true;
      } else {
        return false;
      }
    };

    FodderList.prototype.sufficentProteinEnergyQuotient = function(nominator, denominator) {
      return this.__sufficientQuotient(nominator, denominator, 6);
    };

    FodderList.prototype.sufficentCalciumPhosphorQuotient = function(nominator, denominator) {
      return this.__sufficientQuotient(nominator, denominator, 1.5);
    };

    FodderList.prototype.sufficentCalciumMagnesiumQuotient = function(nominator, denominator) {
      return this.__sufficientQuotient(nominator, denominator, 2.7);
    };

    return FodderList;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  root.FodderList = FodderList;

}).call(this);
