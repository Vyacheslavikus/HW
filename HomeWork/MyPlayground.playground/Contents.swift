import UIKit
import os
import Foundation



"""
Создать 4 функции:
- Которая ничего не принимает и ничего не возвращает.
– Принимает параметры но не возвращает.
- Принимает параметры и возвращает.
- Не принимает параметры но возвращает тюпл из 3х параметров.
"""

// Перавая функция, которая ничего не принимает и ничего не возвращает.

func greating () {
    print("Hello, World!")
}

//Вторая функция , которая принимает параметры но не возвращает

func great (name: String) {
    print("Hello, World!")
}

// третья функция, которая принимает и передаёт параметры

var x = 3

var y = 1


func coordinate (x: Int , y: Int) -> Int {
    
    return  x + y
}

// четвёртая функция ко рая не принимает параметры но возвпращает тюпл из 3х параметров.

func getTuple() -> (Int, String, Bool) {
    return (1, "Привет", true)
}


// Создать журнал для учителя, который будет принимать имя студента , профессию и оценку и записывает это все в массив. И внесите 10 студентов туда и распечатаете через цикл for.


//Я всё таки решил сделать 2 варианта. Первый c использованием структуры:

struct Student {
    var name : String
    var occupation : String
    var value : Int
}

var journalLog : [Student] = []

func addStudent (name:String , occupation:String , value:Int) {
    let student = Student(name:name, occupation: occupation, value: value)
    journalLog.append(student)
}


addStudent(name : "Анна", occupation : "Инженер", value : 95)
addStudent(name : "Иван", occupation : "Медик", value : 88)
addStudent(name : "Мария", occupation : "Химик", value : 78)
addStudent(name : "Петр", occupation : "Программист", value : 92)
addStudent(name : "Екатерина", occupation : "Учитель", value : 87)
addStudent(name : "Алексей", occupation : "Дизайнер", value : 80)
addStudent(name : "Светлана", occupation : "Биолог", value : 91)
addStudent(name : "Дмитрий", occupation : "Физик", value : 89)
addStudent(name : "Ольга", occupation : "Лингвист", value : 94)
addStudent(name : "Владимир", occupation : "Историк", value : 86)

for student in journalLog {
    print("Имя: \(student.name), профессия: \(student.occupation), оценка: \(student.value)")
}

// Второй через тюпл


var journal : [(Name:String , Occupation:String, Value:Int)] = []

func addrookie (Name:String , Occupation:String , Value:Int) {
    let rookie = (Name,Occupation,Value)
    journal.append(rookie)
}

addrookie(Name: "Alice", Occupation: "Adventurer", Value: 95)
addrookie(Name: "Bob", Occupation: "Mage", Value: 88)
addrookie(Name: "Charlie", Occupation: "Warrior", Value: 78)
addrookie(Name: "David", Occupation: "Thief", Value: 92)
addrookie(Name: "Eve", Occupation: "Sorceress", Value: 87)
addrookie(Name: "Frank", Occupation: "Knight", Value: 80)
addrookie(Name: "Grace", Occupation: "Bard", Value: 91)
addrookie(Name: "Henry", Occupation: "Ranger", Value: 89)
addrookie(Name: "Isabel", Occupation: "Cleric", Value: 94)
addrookie(Name: "Jack", Occupation: "Blacksmith", Value: 86)


for rookie in journal {
    print("Имя: \(rookie.Name), профессия: \(rookie.Occupation), оценка: \(rookie.Value)")
}


//Создать функцию которая принимает имя и фамилию, потом положить это в массив и отсортировать и вывести результат в консоль.


var names : [String] = []

func addName (firstName:String , secondName:String) {
    let fullName = firstName + " " + secondName
    names.append(fullName)
}



func sortedAndPrintNames(){
    let sortedNames = names.sorted()
        for name in sortedNames {
            print(name)
    }
}

addName(firstName: "Сергей", secondName: "Иванов")
addName(firstName: "Евгений", secondName: "Сычёв")
addName(firstName: "Алексей", secondName: "Скутаренко")

sortedAndPrintNames()

// Создать функцию которая принимает параметры и вычисляет площадь круга.

func calculateSircleArea (radius:Double) -> Double {
    let pi = 3.14159265359
    let Area = pi * pow(radius,2)
    return Area
}

var radius = 5.0
let sircleArea = calculateSircleArea ( radius:radius)

print ("Площадь круга -",sircleArea)



// Создать те пустой массив кошелек, создайте функцию которая принимает массив в параметрах и в теле функции добавляет в этот массив значение 100. Далее вызовите массив и потом распечатайте значение массива

var wallet : [Int] = []

func addWallet (array : [Int] ) -> [Int] {
    var newArray = array
    newArray.append(100)
    return newArray
}

wallet = addWallet(array: wallet)
 
print ("Содержимое кошелька:",wallet)

// Написать функцию в которой можно передавать в параметры каждый раз разное количество Int например иногда 1,5,9 а следующий раз 5,10, 11, 20, 50 функция все это посчитает и вернет сумму этих чисел.

func sumOfIntegers(_ numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}


let sum1 = sumOfIntegers(1, 5, 9)
let sum2 = sumOfIntegers(5, 10, 11, 20, 50)

print("Сумма первого массива:", sum1)
print("Сумма второго массива:", sum2)
