//
//  GateRunner.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

public class GateRunner {
    private var model: [Gate]
    
    public init(for model: [Gate]) {
        self.model = model
    }
    
    public func simulate() {
        while(model.map { $0.hasChanged }.contains(true)) {
            model.forEach { gate in
                gate.run()
            }
        }
    }
}
