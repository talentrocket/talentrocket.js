(function() {
  var Config, Profile, Project, Request, encode, exports, rest, root;

  rest = require('rest');

  encode = require('rest/mime/type/application/x-www-form-urlencoded');

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

    Request.make = function(url, opts, callback) {
      var _ref;
      opts['path'] = "https://api.talentrocket.io/v1" + url;
            if ((_ref = opts['params']) != null) {
        _ref;
      } else {
        ({});
      };
      opts['params']['access_token'] = Config.api_key;
      return rest(opts).then(function(response) {
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
      return Request.make("/profiles/search", {
        method: 'GET',
        params: {
          username: opts['name']
        }
      }, callback);
    };

    return Profile;

  })();

  Project = (function() {
    function Project() {}

    Project.find = function(opts, callback) {
      return Request.make("/projects/github_repositories/search", {
        method: 'GET',
        params: {
          name: opts['name']
        }
      }, callback);
    };

    Project.create = function(opts, callback) {
      return Request.make("/projects/github_repositories", {
        method: "POST",
        params: {
          name: opts['name']
        }
      }, callback);
    };

    return Project;

  })();

  exports.Config = Config;

  exports.Profile = Profile;

  exports.Project = Project;

}).call(this);
