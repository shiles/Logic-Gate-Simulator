//
//  Sequences+Extensions.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

extension Sequence {
    
    func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keyPath] }
    }
}
