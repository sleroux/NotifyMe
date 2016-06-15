/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import XCTest
@testable import NotifyMe

class SubscriptionModelTest: XCTestCase {
    func testEncoderDecoderMethods() {
        let subscription = SubscriptionModel(title: "Title", link: "Linky")
        let data = NSKeyedArchiver.archivedDataWithRootObject(subscription)
        let rehydratedSubscription = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? SubscriptionModel
        XCTAssertNotNil(rehydratedSubscription)
        XCTAssertEqual(rehydratedSubscription?.title, "Title")
        XCTAssertEqual(rehydratedSubscription?.link, "Linky")
    }
}
