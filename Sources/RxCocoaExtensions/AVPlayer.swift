//
//  AVPlayer+Rx.swift
//  RxCocoaExtensions
//
//  Created by Alexander Kolov on 2019-10-08.
//  Copyright © 2019 Alexander Kolov. All rights reserved.
//

import AVFoundation
import RxCocoa
import RxSwift

extension Reactive where Base: AVPlayer {

  public var isPlaying: Binder<Bool> {
    return Binder(self.base) { player, playing in
      if playing {
        player.play()
      }
      else {
        player.pause()
      }
    }
  }

}
