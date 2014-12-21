// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var number = 10
str = "Swift"
let string = "Constant String"


var optionalString:String?
optionalString = "Optional"
if let uOptionalString = optionalString {
    println(uOptionalString)
}else{
    println("OptionalString is nil")
}


var person1 = "Ryan"
var person2 = "Adams"

var combinedString = "\(person1) Hello, \(person2)"

var tipString = "2499"
var tipInt = tipString.toInt()

var gTipInt = 0

if let uTipInt = tipInt {
    gTipInt = uTipInt
}

var combineNumber = "\(combinedString) \(gTipInt)"

println(combineNumber)



for i in 1...10{
    i
}

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}


var n = 20

var flag = 0

for i in 2...n/2{
    
    if n%i == 0 {
     flag = 1
        break
    }
    
    if flag == 0{
        n
    }
}


class Person{
    
    var firstName:String!
    var lastName:String!
    var age:Int!

    func singSong(songName:String, artist:String){
        println("\(self.firstName) is Singing \(songName) played by artist \(artist)")
    }
    
    
}


let person = Person()

person.firstName = "Shrikant"
person.lastName = "Kekane"
person.age=30

person.singSong("Beat It", artist:"MJ")





















