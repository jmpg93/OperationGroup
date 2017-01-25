//: Playground - noun: a place where people can play

import Foundation
import OperationGroup
import PlaygroundSupport

/*
let group = OperationGroup()
group.maxConcurrentOperationCount = 1

for i in 0...20 {
    group.add {
        sleep(1)
        print("Operation \(i)")
    }
}

let queue = OperationQueue()
queue.addOperation(group)
*/


let group = BlockOperation(block: { print("OP") })

for i in 0...20 {
    group.addExecutionBlock {
        print("Operation \(i)")
    }
}

let single = BlockOperation(block: { print("single") })

let queue = OperationQueue()
queue.maxConcurrentOperationCount = 1

queue.addOperation(group)
queue.addOperation(single)


PlaygroundPage.current.needsIndefiniteExecution = true