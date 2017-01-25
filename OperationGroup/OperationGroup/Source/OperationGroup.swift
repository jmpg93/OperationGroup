//
//  OperationGroup.swift
//  OperationGroup
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public class OperationGroup : BasicOperation {

    private let queue: OperationQueue
    
    var maxConcurrentOperationCount: Int {
        get {
            return queue.maxConcurrentOperationCount
        }
        set {
            queue.maxConcurrentOperationCount = newValue
        }
    }
    
    public override init() {
        queue = OperationQueue()
        queue.isSuspended = true
    }
    
    public func add(subOperations ops: [Operation]) {
        ops.forEach(enqueue)
    }

    public func add(block: @escaping OperationBlock) {
        enqueue(operation: SingleOperation(block: block))
    }
    
    public func add(subOperation op: Operation) {
        enqueue(operation: op)
    }
    
    private func enqueue(operation: Operation) {
        addDependency(operation)
        queue.addOperation(operation)
    }
    
    public override func main() {
        if isCancelled {
            return
        }
        
        print("Group main")
        
        queue.isSuspended = false
        
        queue.waitUntilAllOperationsAreFinished()
        
        print("Group finish")
        
        finish()
        
    }
}
