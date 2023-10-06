import UIKit

var greeting = "Hello, playground"

var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// Выведет "someInts is of type [Int] with 0 items."

var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles имеет тип [Double] и равен [0.0, 0.0, 0.0]

var shoppingList = ["Eggs", "Milk"]
print("The shopping list contains \(shoppingList.count) items.")
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"

shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 0)
let mapleSyrup = shoppingList.remove(at: 0)
var Apples = shoppingList.removeLast()
print(shoppingList)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
if favoriteGenres.isEmpty {
    print("Мне все равно какая музыка играет. Я не придирчив.")
} else {
    print("У меня есть свои музыкальные предпочтения.")
}
favoriteGenres.insert("Jazz")
print(favoriteGenres)

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? С меня хватит.")
} else {
    print("Меня это не сильно заботит.")
}
if favoriteGenres.contains("Funk") {
    print("О! Да я встал с правильной ноги!")
} else {
    print("Слишком много Funk'а тут.")
}
print(favoriteGenres)

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
 
oddDigits.union(evenDigits).sorted()

oddDigits.intersection(evenDigits).sorted()

oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

// домашняя работа по массивам

let dollar = [1, 5, 10, 20, 50, 100] // Пример массива с номиналами купюр в долларах
var totalMoney = 0

for bill in dollar {
    totalMoney += bill
}

print("Общая сумма денег в массиве: $\(totalMoney)")

let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

for (index, days) in daysInMonths.enumerated() {
    let monthNumber = index + 1
    print("В месяце номер \(monthNumber) - \(days) дней")
}

let months = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]

for (index, month) in months.enumerated() {
    let days = daysInMonths[index]
    print("\(month) - \(days) дней")
}

let monthData = [("Январь", 31), ("Февраль", 28), ("Март", 31), ("Апрель", 30), ("Май", 31), ("Июнь", 30), ("Июль", 31), ("Август", 31), ("Сентябрь", 30), ("Октябрь", 31), ("Ноябрь", 30), ("Декабрь", 31)]

for (monthName, days) in monthData {
    print("\(monthName) - \(days) дней")
}


for index in stride(from: monthData.count - 1, through: 0, by: -1) {
    let (monthName, days) = monthData[index]
    print("\(monthName) - \(days) дней")
}
let mixedArray: [Any] = ["Привет", 42, true, 3.14, "Мир", false]

var stringArray: [String] = []

for element in mixedArray {
    if let str = element as? String {
        stringArray.append(str)
    }
}
print(stringArray)

let twoDimArray = [["Hello", "Hi"], ["Привет"], [".", "Как", "твои"], ["дела?"]]

var oneDimArray: [String] = []

for subArray in twoDimArray {
    for element in subArray {
        oneDimArray.append(element)
    }
}

if oneDimArray.isEmpty {
    print("Одномерный массив пуст.")
} else {
    if oneDimArray.contains("Привет") {
        print("Одномерный массив содержит элемент 'Привет'.")
    } else {
        print("Одномерный массив не содержит элемент 'Привет'.")
    }
}

// Создайте массив типа Int из 10 элементов используя Range новый массив с элементами под индексами от 3 до 8.
let originalArray = Array(1...10)


let newArray = Array(originalArray[3...8])

// Создайте массив типа Int из 10 элементов используя Slice новый массив с элементами под индексами от 3 до 8.
// Я использовал уже созданый массив, чтобы не засорять код

let slice = originalArray[3..<9]

// Создайте массив типа String из 8 элементов с помощью sorted() и sort() отсортируйте и в коментах напишите в чем разница этих двух методов.

var newStrinArray:[String] = ["one","two","three","four","five","six","seven","eight"]
let newStringArraySorted = newStrinArray.sorted()

print(newStringArraySorted)
print(newStrinArray)

newStrinArray.sort()
print(newStrinArray)


"""
Операторы sorted и sort сортируют массив (в данном случае по расставляя значения по алфавиту). Различие в
том, что оперетор sorted содаёт новый массив с отсортированными данными, не трогая исходный. А оператор sort
сортирует и изменяет исходный массив
"""

//Дан массив [22, 41, 23, 80, 33, 83, 56, 42, 11, 98, 120, 6, 84, 1] выведите максимальный и минимальный элемент. выведите первый и последний элемент. удалите первый и последний элемент. опишите в чем разница dropFirst() dropLast() от removeFirst() и removeLast().


let somearray = [22, 41, 23, 80, 33, 83, 56, 42, 11, 98, 120, 6, 84, 1]
let maxElement = somearray.max()
let minElement = somearray.min()

if let maxElement = maxElement {
    print("Максимальный элемент: \(maxElement)")
}

if let minElement = minElement {
    print("Минимальный элемент: \(minElement)")
}

