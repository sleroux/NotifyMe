/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Deferred
import Result

// A termination case.
infix operator >>== { associativity left precedence 160 }
public func >>== <T, E>(x: Deferred<Result<T, E>>, f: (T) -> ()) {
    return x.upon { result in
        if let v = result.value {
            f(v)
        }
    }
}