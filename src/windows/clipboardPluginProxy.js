cordova.commandProxy.add("Clipboard", {
  copy: function(successCallback, errorCallback, text) {
    if (!text || !text.length) {
      errorCallback("Copy Error, something was wrong with the input string. =>" + text);

      return;
    }

    try { 
      // create the datapackage 
      var dataPackage = new Windows.ApplicationModel.DataTransfer.DataPackage(); 
      dataPackage.setText(text); 
      
      // copy the content to Clipboard 
      Windows.ApplicationModel.DataTransfer.Clipboard.setContent(dataPackage); 
    } catch (e) { 
      // Copying data to Clipboard can potentially fail - for example, if another application is holding Clipboard open 
      errorCallback("Error copying content to Clipboard: " + e + ". Try again."); 

      return;
    } 

    successCallback();
  },
  paste: function(successCallback, errorCallback, text) {
    if (!text || !text.length) {
      errorCallback("Paste Error, something was wrong with the input string. =>" + text);

      return;
    }

    errorCallback("Paste Not implemented");

    successCallback();
  },
});