import UIKit


let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print (threeDoubleQuotes)

let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

var emptyString = ""
if emptyString.isEmpty {
 print("Здесь нехуй смотреть")
}

var variableString = "Horse"
variableString += " and carriage"
print (variableString)

// print ("U+1F425")

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// итерполяция строк, должно быть значение "3 times 2.5 is 7.5"

print (message)


var greeting = "Guten Tag!"
 greeting[greeting.startIndex]
 // G
 greeting[greeting.index(before: greeting.endIndex)]
 // !
 greeting[greeting.index(after: greeting.startIndex)]
 // u

 let index = greeting.index(greeting.startIndex, offsetBy: 7)
 greeting[index]
 // a
"""
for index in greeting.indices {
 print("\(greeting[index]) " , terminator: " ")
 }
"""


var welcome = "hello"
 welcome.insert("!", at: welcome.endIndex)

welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))

welcome.remove(at: welcome.index(before: welcome.endIndex))

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex; welcome.removeSubrange(range)
 print(welcome)
