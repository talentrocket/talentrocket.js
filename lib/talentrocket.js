(function() {
  var Profile, Project, Request, api_key, exports, rest, root;

  rest = require('rest');

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.api = {};

  exports = root.api;

  api_key = function(api_key) {
    this.api_key = api_key;
  };

  Request = (function() {
    function Request() {}

    Request.get = function(url, callback) {
      var request;
      request = {
        path: "https://api.talentrocket.io/v1" + url,
        method: 'GET'
      };
      return rest(request).then(function(response) {
        console.log(response);
        return callback(response);
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

    Profile.find_by = function(opts, callback) {
      return Request.get('/profiles', callback);
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

  exports.api_key = api_key;

  exports.Profile = Profile;

  exports.Project = Project;

}).call(this);
