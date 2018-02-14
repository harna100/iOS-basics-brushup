//: Playground - noun: a place where people can play

import UIKit

// example declaration
var closureDeclaration: () -> () = {}

// basic example
var basicClosure = { (paramString:String ) -> Void in
    print(paramString)
}

basicClosure("Hello World")


// similar example, but in short hand
var shortClosure: (String) -> String = { message in return "\(message)"}

print(shortClosure("Hello World"))

// closures as function parameters

func useStrings(closure: ([String]) -> Void){
    let strings = ["s1", "s2", "s3"]
    closure(strings)
}

useStrings { (test) in
    for t in test{
        print("\(t)")
    }
}


// practical example

var toSort = [4,5,3,346,7,7,34,234,5,8,7689,456,345,43,567,678,768]


var smallToLarge:(Int,Int) -> Bool = {$0 < $1}
var largeToSmall:(Int, Int) -> Bool = {!smallToLarge($0,$1)}

var smallSorted = toSort.sorted(by: smallToLarge)
var largeSorted = toSort.sorted(by: largeToSmall)

print(smallSorted)
print(largeSorted)






















