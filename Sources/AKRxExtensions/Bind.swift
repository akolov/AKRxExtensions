//
//  FlatMapWeak.swift
//  AKRxExtensions
//
//  Created by Alexander Kolov on 2020-05-06.
//  Copyright © 2020 Alexander Kolov. All rights reserved.
//

import RxRelay
import RxSwift

extension ObservableType {

  /**
   Creates new subscription and sends elements to behavior relay(s).
   In case error occurs in debug mode, `fatalError` will be raised.
   In case error occurs in release mode, `error` will be logged.
   - parameter to: Target behavior relay for sequence elements.
   - returns: Disposable object that can be used to unsubscribe the observer.
   */
  public func bind(to relays: BehaviorRelay<Self.Element>?...) -> Disposable {
    return self.bind(to: relays.compactMap { $0 })
  }

  private func bind(to relays: [BehaviorRelay<Element>]) -> Disposable {
    return subscribe { e in
      switch e {
      case let .next(element):
        relays.forEach {
          $0.accept(element)
        }
      case let .error(error):
        rxFatalErrorInDebug("Binding error to behavior relay: \(error)")
      case .completed:
        break
      }
    }
  }

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
