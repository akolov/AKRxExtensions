//
//  Void.swift
//  RxExtensions
//
//  Created by Alexander Kolov on 2019-09-09.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

import RxSwift

extension ObservableType {

  public func void() -> Observable<Void> {
    return map { _ in () }
  }

}

extension PrimitiveSequence where Trait == SingleTrait {

  public func void() -> Single<Void> {
    return map { _ in () }
  }

}

extension PrimitiveSequence where Trait == MaybeTrait {

  public func void() -> Maybe<Void> {
    return map { _ in () }
  }

}
