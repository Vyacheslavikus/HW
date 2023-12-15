import UIKit

// Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его

extension String {
    subscript(range: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(startIndex, offsetBy: range.upperBound)
        return String(self[start..<end])
    }
}


// Расширить Int и добавить 3 метода: возведение в квадрат, в куб, в степень

extension Int {
    func squared() -> Int {
        return (self * self)
    }
    
    func tripled() -> Int {
        return (self * self * self)
    }
    func exponentiation(_ index: Int) -> Int {
        return Int(pow(Double(self), Double(index)))
    }
}

//Расширить еще 3 структуры (написать свои, либо взять на свой вкус и в комментах обосновать для чего это было сделано

// Это расширение, чтоб подсчитывать количество символов в строке.

extension String {
    func counting() -> Int {
        self.count
    }
}

// Это расширение объединяет несколько параметров в структуре и сразу выводит их

struct Car {
    var brand: String
    var model: String
    var year: Int
}

extension Car {
    func Introducing() -> String {
        return "\(brand) \(model), производства \(year) года"
    }
}

let car = Car(brand: "Toyota", model: "Land Cruiser", year: 2019)
print(car.Introducing())

// это расширение заменяет первую строчную букву на заглавную

extension String {
    func capitalazingFirst() -> String {
        return self.prefix(1).capitalized + self.dropFirst()
    }
}

let name = "иван"

print(name.capitalazingFirst())

//Добавьте проперти, которое возвращает количество символов в числе добавить метод, который говорит, что число положительное или отрицательное


extension Int {
    var charactersCounting: Int {
        return String(self).count
    }
    
    func chekingPositive() -> String {
        if self > 0 {
            return "Число положительное"
        } else if self < 0 {
            return "Число отрицательное"
        } else {
            return "Ноль"
        }
    }
}

let number = 12345345245324564
print(number.charactersCounting)
print(number.chekingPositive())


