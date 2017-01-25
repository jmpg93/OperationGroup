//
//  SingleOperation.swift
//  OperationGroup
//
//  Created by Jose Maria Puerta on 25/1/17.
//  Copyright © 2017 Jose Maria Puerta. All rights reserved.
//

import Foundation

public typealias OperationBlock = () -> ()

public class SingleOperation : BasicOperation {
    
    fileprivate var block: OperationBlock
    
    public init(block: @escaping OperationBlock) {
        self.block = block
    }

    override public func main() {
        if isCancelled {
            return
        }
        
        block()
        
        finish()
    }
}
