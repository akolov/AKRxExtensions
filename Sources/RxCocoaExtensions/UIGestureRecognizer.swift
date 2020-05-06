//
//  UIGestureRecognizer.swift
//  RxCocoaExtensions
//
//  Created by Alexander Kolov on 2020-05-06.
//  Copyright © 2020 Alexander Kolov. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIGestureRecognizer {

  public var isEnabled: Binder<Bool> {
    return Binder(base) { recognizer, flag in
      recognizer.isEnabled = flag
    }
  }

}

