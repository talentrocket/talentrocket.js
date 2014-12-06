(function() {
  var Config, Profile, Project, Request, exports, rest, root;

  rest = require('rest');

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.api = {};

  exports = root.api;

  Config = (function() {
    function Config() {}

    Config.set_api_key = function(api_key) {
      this.api_key = api_key;
    };

    return Config;

  })();

  Request = (function() {
    function Request() {}

    Request.get = function(url, callback) {
      var request;
      request = {
        path: "https://api.talentrocket.io/v1" + url + "&access_token=" + Config.api_key,
        method: 'GET'
      };
      return rest(request).then(function(response) {
        return callback(JSON.parse(response.entity));
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
      return Request.get("/profiles/search?username=" + opts['name'], callback);
    };

    return Profile;

  })();

  Project = (function() {
    function Project() {}

    Project.prototype.toJson = function() {
      return this.json;
    };

    Project.find = function(name) {};

    return Project;

  })();

  exports.Config = Config;

  exports.Profile = Profile;

  exports.Project = Project;

}).call(this);
