var exec = require('cordova/exec');

exports.init = function(arg, success, error) 
{ 
    if(!arg)
    {
        //throw new Error('');
        return error(new Error('Empty credentials'));
    }

    if(!(arg['username'] && arg['password']))
    {
        return error(new Error('Empty credentials'));
    }

     exec(success, error, "watsonstt", "initialize", [arg]);
};

exports.speechToText = function(arg, success, error)
{
    exec(success, error, "watsonstt", "speechToText", [arg]);
};

exports.setListeningStatusCallback = function(success, error)
{
    exec(success, null, "watsonstt", "listeningStatusCallback", [null]);
};

exports.setVoiceLevelCallback = function(success, error)
{
    exec(success, null, "watsonstt", "voiceLevelCallback", [null]);
};

exports.stopListening = function(arg, callback)
{
    exec(callback, null, "watsonstt", "stopListening", [arg]);
};