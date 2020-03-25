//
//  Gates.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

public protocol Gate {
    var description: String { get set }
    var inputs: [Gate] { get set }
    var output: Bool { get }
    var hasChanged: Bool { get }
    
    func run()
}

public class Not: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public func run() {
        guard let input = inputs.first?.output else { fatalError() }
        let val = !input
        hasChanged = output != val
        output = val
    }
}

public class Or: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = first || second
        hasChanged = output != val
        output = val
    }
}

public class Nor: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = !(first || second)
        hasChanged = output != val
        output = val
    }
}

public class And: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = first && second
        hasChanged = output != val
        output = val
    }
}

public class Nand: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    public init() {}
        
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = !(first && second)
        hasChanged = output != val
        output = val
    }
}

public class Xor: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = first ^ second
        hasChanged = output != val
        output = val
    }
}

public class Xnor: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = !(first ^ second)
        hasChanged = output != val
        output = val
    }
}

public class Input: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    public init() {}
    
    public init(initialValue: Bool) {
        output = initialValue
    }
    
    public func run() {}
}

public class Output: Gate {
    public var description: String = ""
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = true
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output else { fatalError() }
        output = first
        hasChanged = false
    }
}
