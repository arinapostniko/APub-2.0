//
//  Bindable.swift
//  APub 2.0
//
//  Created by Arina Postnikova on 13.01.23.
//

import Foundation

class Bindable<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
