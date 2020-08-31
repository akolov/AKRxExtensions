//
//  MapWeak.swift
//  AKRxExtensions
//
//  Created by Alexander Kolov on 2020-05-05.
//  Copyright © 2020 Alexander Kolov. All rights reserved.
//

import RxSwift

extension ObservableType {

  public func map<A: AnyObject, ResultType>(weak obj: A, selector: @escaping (A, Self.Element) throws -> ResultType) -> Observable<ResultType?> {
    return map { [weak obj] value -> ResultType? in
      try obj.map { try selector($0, value) }
    }
  }

}
