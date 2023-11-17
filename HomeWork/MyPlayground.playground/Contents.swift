import UIKit
import Foundation
import CoreGraphics
import Darwin

//Создать по 1-2 enum разных типов.

enum dayWeek {
    case Monday
    case Thusday
    case Wednesday
    case Thurday
    case Frayday
    case Saturday
    case Sunday
    
}

//Создать несколько своих enum, названия какие хотите: например, анкета сотрудника - пол, возраст,ФИО, стаж. Используйте switch как в видео.

enum anketa {
    case age
    case expierence
    enum name{
        case firstName
        case secondName
    }
}

enum car {
    case type
    case price
    case millege
}

// Создать enum со всеми цветами радуги. Создать функцию, которая содержит названия разных предметов или объектов. Пример результата в консоли "apple green", "sun red" и т.д.


enum Сolors {
    case red
    case orange
    case yellow
    case green
    case blue
    case magenta
    case purpole
}




//Создать Enum Vehicles. Добавить в него 3 вложенных Enum: Cars, Ships, Bikes. В каждом Enum добавить по 3 значения. Каждое значение имеет 2 ассоциативных типа (String, Int).

//
enum Vehicles {
    enum Cars {
        case bmw(String, Int)
        case mercedes(String, Int)
    }
    enum Ships {
        case little(String, Int)
        case big(String, Int)
    }
    enum Bikes {
        case yamaha(String, Int)
        case hayabusa(String, Int)
    }
}

var price = Vehicles.Cars.bmw("Dollars", 10000)

print (price)

// Создать функцию, принимающую в качестве параметра элемент Vehicles.Cars.
//
//C помощью switch вывести для найденного кейса ассоциативные значения с припиской «Печать из switch» и вызвать closure, в который передать ассоциативные значения. Closure должен выводить на печать эти значения с припиской «Печать из Closure».
//
//После этого провалиться в следующий элемент switch и вызвать secondClosure(), которая выводить в консоль «Печать из secondClosure»




func processCar(_ car: Vehicles.Cars, closure: (String, Int) -> (), secondClosure: () -> ()) {
    switch car {
    case .bmw(let money, let count):
        print("Печать из switch для price.Валюта: \(money), Стоимость: \(count)  ")
        closure(money, count)
        fallthrough
    case .mercedes(let money, let count):
        print("Печать из switch для.Валюта: \(money), Стоимость: \(count) ")
        closure(money, count)
        secondClosure()
    }
}

let myCar = Vehicles.Cars.mercedes("доллар", 10000)
processCar(myCar, closure: { string, int in
    print("Печать из Closure.Валюта: \(string),Стоимость:  \(int)")
}) {
    print("Печать из secondClosure")
}


// Создать enum House: Int c 5-ю case –ми и задайте им исходные значения


enum House: Int {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    
    var houseNumber: Int {
        return self.rawValue * 100
    }
    
    func printHouseNumber() {
        print("Дом номер \(self) имеет номер \(self.houseNumber)")
    }
}

var myHouse = House.two

myHouse.printHouseNumber()


