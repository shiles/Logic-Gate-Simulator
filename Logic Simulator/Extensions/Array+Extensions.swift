//
//  Array+Extensions.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

extension Array {
    
    public var second: Element? {
        self.count > 1 ? self[1] : nil
    }
}
