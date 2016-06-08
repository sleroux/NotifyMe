/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

'use strict';

var MyExtensionJavaScriptClass = function() {};

MyExtensionJavaScriptClass.prototype = {
    run: function(arguments) {
        var rss = document.querySelector("link[type='application/rss+xml']").getAttribute("href")
        arguments.completionFunction({
            "baseURI": document.baseURI,
            "rss": rss
        });
    },

        // Note that the finalize function is only available in iOS.
    finalize: function(arguments) {
        // arguments contains the value the extension provides in [NSExtensionContext completeRequestReturningItems:completion:].
        // In this example, the extension provides a color as a returning item.
        document.body.style.backgroundColor = arguments["bgColor"];
    }
};

// The JavaScript file must contain a global object named "ExtensionPreprocessingJS".
var ExtensionPreprocessingJS = new MyExtensionJavaScriptClass;

