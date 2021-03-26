//
//  UIViewController.swift
//  AKRxCocoaExtensions
//
//  Created by Alexander Kolov on 2019-09-14.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)

import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIViewController {

  // MARK: View appear events

  public var viewDidLoad: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidLoad)).map { _ in }
    return ControlEvent(events: source)
  }

  public var viewWillAppear: ControlEvent<Bool> {
    let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }

  public var viewDidAppear: ControlEvent<Bool> {
    let source = self.methodInvoked(#selector(Base.viewDidAppear)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }

  public var viewWillDisappear: ControlEvent<Bool> {
    let source = self.methodInvoked(#selector(Base.viewWillDisappear)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }

  public var viewDidDisappear: ControlEvent<Bool> {
    let source = self.methodInvoked(#selector(Base.viewDidDisappear)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }

  // MARK: View layout events

  public var viewWillLayoutSubviews: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewWillLayoutSubviews)).map { _ in }
    return ControlEvent(events: source)
  }

  public var viewDidLayoutSubviews: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidLayoutSubviews)).map { _ in }
    return ControlEvent(events: source)
  }

  public var viewSafeAreaInsetsDidChange: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewSafeAreaInsetsDidChange)).map { _ in }
    return ControlEvent(events: source)
  }

  // MARK: Child controller events

  public var willMoveToParentViewController: ControlEvent<UIViewController?> {
    let source = self.methodInvoked(#selector(Base.willMove)).map { $0.first as? UIViewController }
    return ControlEvent(events: source)
  }

  public var didMoveToParentViewController: ControlEvent<UIViewController?> {
    let source = self.methodInvoked(#selector(Base.didMove)).map { $0.first as? UIViewController }
    return ControlEvent(events: source)
  }

  // MARK: Other events

  public var didReceiveMemoryWarning: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.didReceiveMemoryWarning)).map { _ in }
    return ControlEvent(events: source)
  }

  // MARK: Properties

  /// Rx observable, triggered when the ViewController appearance state changes (true if the View is being displayed, false otherwise)
  public var isVisible: Observable<Bool> {
    let viewDidAppearObservable = self.base.rx.viewDidAppear.map { _ in true }
    let viewWillDisappearObservable = self.base.rx.viewWillDisappear.map { _ in false }
    return Observable<Bool>.merge(viewDidAppearObservable, viewWillDisappearObservable)
  }

  /// Rx observable, triggered when the ViewController is being dismissed
  public var isDismissing: ControlEvent<Bool> {
    let source = self.sentMessage(#selector(Base.dismiss)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }

  public var isModalInPresentation: Binder<Bool> {
    return Binder(base) { vc, flag in
      if #available(iOS 13.0, *) {
        vc.isModalInPresentation = flag
      }
    }
  }

  public var dismiss: Binder<Bool> {
    return Binder(base) { vc, flag in
      vc.dismiss(animated: flag, completion: nil)
    }
  }

}

#endif
