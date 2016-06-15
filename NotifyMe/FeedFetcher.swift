/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import Muon
import Deferred
import Result

enum FeedFetcherError: ResultErrorType {
    case unableToLoadURL(NSError)
    case parseFailed(NSError)
}

struct FeedFetcher {
    private var fetchQueue = NSOperationQueue()
    private var parseQueue = NSOperationQueue()

    private func fetchFeedStringForURL(url: NSURL) -> Deferred<Result<String, FeedFetcherError>> {
        let deferred = Deferred<Result<String, FeedFetcherError>>()
        fetchQueue.addOperation(NSBlockOperation {
            let loadResult = materializedString(contentsOfURL: url, encoding: NSUTF8StringEncoding)
            deferred.fill(
                loadResult.analysis(
                    ifSuccess: { Result($0) },
                    ifFailure: { Result(error: .unableToLoadURL($0)) }
                )
            )
        })

        return deferred
    }

    func fetchFeedForURL(url: NSURL) -> Deferred<Result<Feed, FeedFetcherError>> {
        let deferred = Deferred<Result<Feed, FeedFetcherError>>()
        fetchFeedStringForURL(url) >>== { feedString in
            let parser = FeedParser(string: feedString)
            parser.success { feed in
                deferred.fill(Result(value: feed))
            }
            parser.failure { error in
                deferred.fill(Result(error: .parseFailed(error)))
            }
            self.parseQueue.addOperation(parser)
        }

        return deferred
    }
}

private func materializedString(contentsOfURL url: NSURL,
                                encoding: NSStringEncoding) -> Result<String, NSError> {
    return materialize(try String(contentsOfURL: url, encoding: encoding))
}
