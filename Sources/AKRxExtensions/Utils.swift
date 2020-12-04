//
//  Utils.swift
//  AKRxExtensions
//
//  Created by Alexander Kolov on 2020-12-05.
//  Copyright © 2020 Alexander Kolov. All rights reserved.
//

import Foundation

func rxFatalErrorInDebug(_ lastMessage: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) {
  #if DEBUG
  fatalError(lastMessage(), file: file, line: line)
  #else
  print("\(file):\(line): \(lastMessage())")
  #endif
}
