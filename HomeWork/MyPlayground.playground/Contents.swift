import UIKit
import Foundation




//Создать класс в котором будет массив в котором – «мама» «папа» и «дети». Создать sabscript для этого класса что б у класса был доступ как у массива по индексу.

class Family {
    
    var members: [String]
    
    subscript(index: Int) -> String? {
    get{
        switch index {
        case 0: return members[0]
        case 1: return members[1]
        case 2: return members[2]
        default: return ""
            }
        }
    }
    
    init(members:[String]) {
        self.members = members
    }
}


let myFamily = Family(members: ["папа"])



// Создать сабскрипт который будет принимать число умножать его на 100 и делить на 2.

struct Numbers{

var number: Int = 0
        subscript(Index: Int) -> Int {
            get{
                return  Index * 100 / 2
                
            }
            set {
                number = newValue
            }
        }
}
var myNumber = Numbers()

let result = myNumber[4]

print("Результат вычисления: \(result)")

//Создать свой subscript у которого внутри есть оператор if else.


class MySubscript {
    
    var value: Int
    
    init(value:Int) {
        self.value = value
    }
    subscript(condition: Bool) -> Int {
        get {
            if condition {
                return value + 1
            } else {
                return value
            }
        }
        set {
            if condition {
                value = newValue + 1
            } else {
                value = newValue
            }
        }
    }
        
}

var myValue = MySubscript(value: 1)

let newResult = myValue[true]

print("Число: \(newResult)")


// Создать класс Human и в нем 3 проперти имя , возраст пол.

class Human {
    
    var name: String
    var age: Int
    var sex: String
    
    init(name: String, age: Int, sex: String) {
        self.name = name
        self.age = age
        self.sex = sex
    }
}

class Student: Human {
    
    var school: String
    
    init(name: String, age: Int, sex: String, school: String){
        self.school = school
        super.init(name: name, age: age, sex: sex)
    }
    
    func introducing() {
        print ("Привет. Меня зовут \(name), мне \(age) лет и я \(sex). А учусь я в \(school)")
    }
    
    override var age: Int {
        didSet {
            if age < 16 {
                print("Студент не может быть младше 16 лет!")
                age = oldValue
            }
        }
    }
}


class Employee: Human {
    
    var work: String
    
    init(name: String, age: Int, sex: String, work: String) {
        self.work = work
        super.init(name: name, age: age, sex: sex)
    }
    
    func introducing() {
        print ("Привет. Меня зовут \(name), мне \(age) лет и я \(sex). Я работаю в \(work)")
    }
    
    override var age: Int {
        didSet {
            if age < 18 {
                print("Сотрудник не может быть младше 18 лет!")
                age = oldValue
            }
        }
    }
    
}


// Создать дикшинари который хранит все типы данных которые вы знаете, а ключ должен быть только строка.

var dictionary: [String: Any] = [:]

dictionary["String"] = "Строка"
dictionary["Integer"] = 0
dictionary["Double"] = 0.0
dictionary["Float"] = 0.0000000
dictionary["Boolean"] = true
dictionary["Array"] = [0, 1, 2]
dictionary["Dictionary"] = ["Key": "Value"]
dictionary["Set"] = Set(["apple", "juice", "banana"])
dictionary["Characters"] = "A"
dictionary["Optional"] = Optional("опциональное значение")
dictionary["tuple"] = ("кортеж", 1)
dictionary["Enumеration"] = "перечисляемое, собственное значение"
dictionary["Closure"] = "Замыкание"



