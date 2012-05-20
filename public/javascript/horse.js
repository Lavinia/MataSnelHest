// Generated by CoffeeScript 1.3.1
(function() {
  var Horse, root,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Horse = (function() {
    var feedTypes, genders;

    Horse.name = 'Horse';

    genders = ['mare', 'stallion', 'gelding'];

    feedTypes = ['hard', 'normal', 'easy'];

    function Horse() {
      this.weight = null;
      this.gender = null;
      this.feedType = 'normal';
    }

    Horse.prototype.setWeight = function(weight) {
      var convertedWeight;
      convertedWeight = Number(weight);
      if (isNaN(convertedWeight)) {
        throw "" + weight + " is not a valid number";
      }
      return this.weight = convertedWeight;
    };

    Horse.prototype.setGender = function(gender) {
      if (__indexOf.call(genders, gender) < 0) {
        throw "" + gender + " is not a valid horse gender";
      }
      return this.gender = gender;
    };

    Horse.prototype.setFeedType = function(feedType) {
      if (__indexOf.call(feedTypes, feedType) < 0) {
        throw "" + feedType + " is not a valid horse feed type";
      }
      return this.feedType = feedType;
    };

    return Horse;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : window;

  root.Horse = Horse;

}).call(this);