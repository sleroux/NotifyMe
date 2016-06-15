/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

var SubscribeExtension = function() {};

SubscribeExtension.prototype = {
    run: function(arguments) {
        var rss = document.querySelector("link[type='application/rss+xml']").getAttribute("href");
        arguments.completionFunction({
            "baseURI": document.baseURI,
            "rss": rss
        });
    },

    finalize: function(arguments) {
    }
};

var ExtensionPreprocessingJS = new SubscribeExtension;

