(function() {
  var Profile, Project, Request, exports, rest, root;

  rest = require('rest');

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.talentrocket = {};

  exports = root.talentrocket;

  Request = (function() {
    function Request() {}

    Request.get = function(url) {
      var request;
      request = {
        path: "https://api.talentrocket.io/v1" + url,
        method: 'GET'
      };
      return rest(request).then(function(response) {
        return console.log(response);
      });
    };

    return Request;

  })();

  Profile = (function() {
    function Profile(json) {
      this.json = json;
    }

    Profile.prototype.toJson = function() {
      return this.json;
    };

    Profile.find_by = function(opts) {
      return Request.get("/profiles?search=" + opts['name']);
    };

    return Profile;

  })();

  Project = (function() {
    function Project() {}

    Project.prototype.toJson = function() {
      return this.json;
    };

    Project.find = function(name) {
      return console.log(name);
    };

    return Project;

  })();

  exports.Profile = Profile;

  exports.Project = Project;

}).call(this);
