/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import XCTest
@testable import NotifyMe
import Result
import Muon
import Deferred

class FeedFetcherTests: XCTestCase {
    private var fetcher: FeedFetcher!

    override func setUp() {
        super.setUp()
        fetcher = FeedFetcher()
    }
    
    override func tearDown() {
        super.tearDown()
        fetcher = nil
    }

    func testParseRSS() {
        let url = NSURL(string: "https://medium.com/feed/firefox-mobile-engineering")!
        let feedResult = fetcher.fetchFeedForURL(url).value
        XCTAssertNotNil(feedResult.value)
    }
}
