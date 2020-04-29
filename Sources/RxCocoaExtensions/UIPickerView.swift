//
//  UIPickerView+Rx.swift
//  RxCocoaExtensions
//
//  Created by Alexander Kolov on 2019-11-06.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: UIPickerView {

  public var reload: Binder<Void> {
    return Binder(base) { picker, _ in
      picker.reloadAllComponents()
    }
  }

}
