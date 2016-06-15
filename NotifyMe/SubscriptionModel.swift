/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation

class SubscriptionModel: NSObject, NSCoding {
    let title: String
    let link: String

    init(title: String, link: String) {
        self.title = title
        self.link = link
        super.init()
    }

    required convenience init?(coder aDecoder: NSCoder) {
        guard let titleData = aDecoder.decodeDataObject(),
              let linkData = aDecoder.decodeDataObject(),
              let titleString = String(data: titleData, encoding: NSUTF8StringEncoding),
              let linkString = String(data: linkData, encoding: NSUTF8StringEncoding)
        else {
            return nil
        }

        self.init(title: titleString, link: linkString)
    }

    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeDataObject(title.dataUsingEncoding(NSUTF8StringEncoding)!)
        aCoder.encodeDataObject(link.dataUsingEncoding(NSUTF8StringEncoding)!)
    }
}
