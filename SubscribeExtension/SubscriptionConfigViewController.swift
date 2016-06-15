/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import UIKit
import MobileCoreServices

class FeedInfoTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var linkLabel: UILabel!
    @IBOutlet var feedImageView: UIImageView!
}

class SubscriptionConfigViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the item[s] we're handling from the extension context.
        for item: AnyObject in self.extensionContext!.inputItems {
            let inputItem = item as! NSExtensionItem
            for provider: AnyObject in inputItem.attachments! {
                let itemProvider = provider as! NSItemProvider
//                itemProvider.loadItemForTypeIdentifier(kUTTypePropertyList as String, options: nil, completionHandler: { item, error in
//                    guard let dict = item as? NSDictionary,
//                          let result = dict[NSExtensionJavaScriptPreprocessingResultsKey] as? [String: AnyObject] else {
//                        return
//                    }
//
//                    let rssLink = "\(result["baseURI"]!)\(result["rss"]!)"
//                    guard let rssLinkURL = NSURL(string: rssLink) else {
//                        print("Error getting RSS URL: \(rssLink)")
//                        return
//                    }
//                })
            }
        }
    }
}
