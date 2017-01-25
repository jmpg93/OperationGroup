//
//  BasicOperation.swift
//  OperationGroup
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class BasicOperation : Operation {
    private var _finished = false
    private var _executing = false
    private var _ready = true
    
    public override var isReady: Bool {
        get { return _ready }
        set {
            willChangeValue(forKey: "isReady")
            _ready = newValue
            didChangeValue(forKey: "isReady")
        }
    }
    
    override public var isExecuting: Bool {
        get { return _executing }
        set {
            willChangeValue(forKey: "isExecuting")
            _executing = newValue
            didChangeValue(forKey: "isExecuting")
        }
    }
    
    override public var isFinished: Bool {
        get { return _finished }
        set {
            willChangeValue(forKey: "isFinished")
            _finished = newValue
            didChangeValue(forKey: "isFinished")
        }
    }
    
    public func finish() {
        _finished = true
    }
}

