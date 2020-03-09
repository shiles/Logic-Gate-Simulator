//
//  Bool+Extensions.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

extension Bool {
    
    static func ^ (left: Bool, right: Bool) -> Bool {
        left != right
    }
}
