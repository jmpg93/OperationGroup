//: Playground - noun: a place where people can play

import Cocoa
import OperationGroup

let group = OperationGroup()

for i in 0...20 {
    group.add {
        print("Operation \(i)")
    }
}

let queue = OperationQueue()

queue.addOperation(group)