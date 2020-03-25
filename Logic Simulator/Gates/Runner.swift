//
//  GateRunner.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

class Runner {
    
    static func simulate(_ model: GateModel) {
        model.compactMap{ $0 as? Output }.forEach { $0.hasChanged = true }
        
        while(model.outputsDidChange) {
            model.forEach { gate in gate.run() }
        }
    }
}
