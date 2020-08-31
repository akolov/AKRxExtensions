//
//  UIViewController.swift
//  AKRxCocoaExtensions
//
//  Created by Alexander Kolov on 2019-09-14.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIViewController {

  public var isModalInPresentation: Binder<Bool> {
    return Binder(base) { vc, flag in
      #if swift(>=5.1)
      if #available(iOS 13.0, *) {
        vc.isModalInPresentation = flag
      }
      #endif
    }
  }

}
