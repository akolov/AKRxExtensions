//
//  FlatMapWeak.swift
//  AKRxExtensions
//
//  Created by Alexander Kolov on 2020-05-06.
//  Copyright © 2020 Alexander Kolov. All rights reserved.
//

import RxSwift

extension ObservableType {

  /**
   Creates new subscription and sends elements to observer(s).
   In this form, it's equivalent to the `subscribe` method, but it better conveys intent, and enables
   writing more consistent binding code.
   - parameter to: Observers to receives events.
   - returns: Disposable object that can be used to unsubscribe the observers.
   */
  public func bind<Observer: ObserverType>(to observers: Observer?...) -> Disposable where Observer.Element == Element {
    return self.bind(to: observers.compactMap { $0 })
  }

  /**
   Creates new subscription and sends elements to observer(s).
   In this form, it's equivalent to the `subscribe` method, but it better conveys intent, and enables
   writing more consistent binding code.
   - parameter to: Observers to receives events.
   - returns: Disposable object that can be used to unsubscribe the observers.
   */
  public func bind<Observer: ObserverType>(to observers: Observer?...) -> Disposable where Observer.Element == Element? {
    return self.map { $0 as Element? }.bind(to: observers.compactMap { $0 })
  }

  private func bind<Observer: ObserverType>(to observers: [Observer]) -> Disposable where Observer.Element == Element {
    return self.subscribe { event in
      observers.forEach { $0.on(event) }
    }
  }

}
