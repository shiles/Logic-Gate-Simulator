//
//  GateModel.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

typealias GateModel = [Gate]

extension GateModel {
    
    var outputsDidChange: Bool {
        self.map{ $0.hasChanged }.contains(true)
    }
    
}
