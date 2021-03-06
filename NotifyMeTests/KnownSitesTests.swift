/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import XCTest
import NotifyMe

class KnownSitesTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFeedURLForMedium() {
        let knownSite = KnownSiteMedium()
        let url = NSURL(string: "https://medium.com/firefox-mobile-engineering")!
        XCTAssertEqual("https://medium.com/feed/firefox-mobile-engineering", knownSite.feedURLFromURL(url)!.absoluteString)
    }
}
