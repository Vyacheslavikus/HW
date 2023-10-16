import UIKit

var greeting = "Hello, playground"

// Создайте 1 пустой тюпл.

let simpleTuple = ()

//Создайте тюпл где первое значение 1, второе элемент массива “threee”. Распечатайте все значения.


let newTuple = (1, "Threee")

print(newTuple)

//Создайте тюпл с Int, Bool, String значениями. Распечатайте все значения.

let myTuple = (42, true, "Hello, World")
print(myTuple)

// Создайте тюпл где первое значение строка а второе предыдущий тюпл. Распечатайте все значения.

let combinedTuple: (String, (Int, Bool, String)) = ("Nested Tuple", (42, true, "Hello, World"))
print("Outer String: \(combinedTuple.0)")
print("Inner Int: \(combinedTuple.1.0), Inner Bool: \(combinedTuple.1.1), Inner String: \(combinedTuple.1.2)")

//Создайте тюпл из значений “Apple”, «IBM» ,

var bigComaniesTuple = ("Apple" , "IBM")

// Добавляем google

let tupleWithGoogle = (bigComaniesTuple, "Google")

// Убираем IBM

let tupleWithoutIBM = (bigComaniesTuple.0 ,tupleWithGoogle.1)

print("Тюпл с добавленным 'Google': \(tupleWithGoogle)")

print("Тюпл с удалённым 'IBM': \(tupleWithoutIBM)")


// Создаем тюпл с внутренним словарем
var tupleWithDictionary: (String, [String: Any]) = ("Apple", ["Company": "IBM"])


tupleWithDictionary.1["Company"] = "Google"



print("Тюпл после удаления записи: \(tupleWithDictionary)")

// Создайте 3 константы имя, фамилия, отчество и объедените их в новом кортеже.

let имя = "Василий"
let фамилия = "Пупкин"
let отчество = "Залупкин"

let FIO = (имя, фамилия, отчество)

print ("ФИО: \(FIO)")
       
