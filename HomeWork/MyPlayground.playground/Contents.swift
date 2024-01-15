import UIKit

// Создать протокол BatmanProtocol у которого свойство name.

protocol BatmanProtocol {
    var name: String { get }
}

// Добавить дефолтную реализацию протоколу BatmanProtocol через экстеншен добавить свое имя.

extension BatmanProtocol {
    var name: String {
        return "Batman"
    }
}

//Создать класс Batman подписатся на протокол BatmanProtocol, создать обьект класса и распечатать name.

class Batman: BatmanProtocol {
}

let batman = Batman()

print("What is your name? My name is \(batman.name)!")

//Создать протокол с ассоциативным типом и создать 2 разных класса которые реализуют этот протокол. В 1 м классе 1 тип в другом другой тип.

protocol MyNewProtocol {
    associatedtype ItemType
    var items: [ItemType] { get set }
    func addItem(_ item: ItemType)
}

class TheBestClass: MyNewProtocol {
    var items: [String] = []
    
    typealias ItemType = String
    
    func addItem(_ item: String) {
           items.append(item)
       }
}

class TheWorstClass: MyNewProtocol {
    var items: [Int] = []
    
    typealias ItemType = Int
    
    func addItem(_ item: Int) {
            items.append(item)
        }
}

let theBestClass = TheBestClass()
let theWorstClass = TheWorstClass()

theBestClass.addItem("Привет")
theBestClass.addItem("Мир")

theWorstClass.addItem(1)
theWorstClass.addItem(99)
    
print("The Best Class items : \(theBestClass.items)")
print("The Worst Class items : \(theWorstClass.items) ")
//Создать протокол GoToShopDelegate с методом run.
//Создать класс мама и класс сын. Использовать паттерн delegate что б мама отправляла сына за хлебом.

protocol GoToShopDelegate {
    func run()
}

class Son: GoToShopDelegate {
    func run() {
        print("сын пошёл за в магазин за хлебом")
    }
}

class Mom {
    var delegate: GoToShopDelegate?
    
    func sendSonToShop() {
        delegate?.run()
    }
}

let son = Son()
let mom = Mom()

mom.delegate = son

mom.sendSonToShop()
