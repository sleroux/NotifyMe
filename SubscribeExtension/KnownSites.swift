/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import Result

public protocol KnownSite {
    var urlSearchString: String { get }

    func feedURLFromURL(url: NSURL) -> NSURL?
}

public struct KnownSiteMedium: KnownSite {
    public var urlSearchString = "://medium.com"
    private let regExPattern: String

    public init() {
        regExPattern = "https?://medium.com/([^/]+)(/.*)?"
    }

    public func feedURLFromURL(url: NSURL) -> NSURL? {
        let result = materialize(try NSRegularExpression(pattern: regExPattern, options: .CaseInsensitive))
        let urlString: NSString = url.absoluteString

        guard let pattern = result.value else {
            print("Unable to create regular expression for feeds")
            return nil
        }

        guard let match = pattern.firstMatchInString(url.absoluteString, options: [], range: NSMakeRange(0, urlString.length)) where match.numberOfRanges > 1 else {
            print("Unable to find medium feed path from URL: \(urlString)")
            return nil
        }

        let pathString = urlString.substringWithRange(match.rangeAtIndex(1))
        guard let feedURL = NSURL(string: "https://medium.com/feed/\(pathString)") else {
            print("Unable to create a feed URL using match: \(match)")
            return nil
        }
        return feedURL
    }
}
