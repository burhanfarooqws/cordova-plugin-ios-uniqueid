var exec = require('cordova/exec');

exports.getid = function(success, error) {
    exec(success, error, "UniqueiOSUDID", "getid");
};
