//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func sayHello() {
    print("Hello World")
}


sayHello()


func sayHelloTo(name:String, age:Int) {
    print("Hello \(name), you are \(age) years old")
}

sayHelloTo(name: "Paul", age: 22)


func addFourTo(x:Int) -> Int {
    return x + 4
}

print(addFourTo(x: 5))

