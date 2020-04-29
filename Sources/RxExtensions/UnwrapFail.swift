//
//  UnwrapFail.swift
//  RxExtensions
//
//  Created by Alexander Kolov on 2019-09-09.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

import RxSwift

extension ObservableType {

  public func unwrap<T>(fail error: Error) -> Observable<T> where Element == T? {
    return self.flatMap { value -> Observable<T> in
      if let unwrapped = value {
        return .just(unwrapped)
      }
      else {
        return .error(error)
      }
    }
  }

}
