//
//  Box.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import Foundation

class Boxing<T> {
    typealias Listener = (T) -> Void
    var listener : Listener?
    
    var value : T {
        didSet{
            listener?(value)
        }
    }
    
    init(_ value : T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
}
