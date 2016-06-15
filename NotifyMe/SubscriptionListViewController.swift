/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import UIKit

struct Subscription {
    var title: String
    var link: String
}

class SubscriptionListViewController: UITableViewController {
    let subscriptions: [Subscription] = [
        Subscription(title: "Hacker News", link: "https://news.ycombinator.com/rss"),
        Subscription(title: "Yahoo", link: "https://yahoo.com/rss"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SubscriptionCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = subscriptions[indexPath.row].title
        cell.detailTextLabel?.text = subscriptions[indexPath.row].link
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscriptions.count
    }
}

