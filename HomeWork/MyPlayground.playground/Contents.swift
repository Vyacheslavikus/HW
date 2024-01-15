import UIKit

// Реализовать структуру IOSCollection и создать в ней copy on write как в уроке - https://youtu.be/QsoqHGgX2rE

struct IOSCollection {
    var id = 1
}

class Ref<T> {
    var value: T
    init(value: T) {
        self.value = value
    }
}

struct Container<T> {
    var ref: Ref<T>
    init(value: T) {
        self.ref = Ref(value: value)
    }
    
    var value: T {
        get {
            ref.value
        }
        set{
            guard(isKnownUniquelyReferenced(&ref)) else {
                ref = Ref(value: newValue)
                return
            }
            ref.value = newValue
        }
    }
}

var id = IOSCollection()
var container1 = Container(value: id)
var countainer2 = container1


//Обьяснить в коментах кратко что такое: a) Copy on write.
//#) isKnownUniquelyReferenced().
//в) strong, weak, unowned ссылки.

//Copy on write - это механизм который работает с референсными типами данных, позволяющим новым экземплярам класса, если они идентичные, ссылаться на одну и ту же ячейку памяти, до тех пор, пока не будут внесены изменения в новый экземпляр.

// isKnownUniquelyReferenced - проверка ссылки на уникальность (является ли объект единственным владельцем своих данных)

//strong - ссильная сылка это дефолтный тип ссылок в свифте, увеличивает счётчик ссылок в которые считает ARC.

// weak - слабая ссылка, не увеличивает счетчик ссылок объекта. Если объект, на который указывает слабая ссылка, освобождается, то слабая ссылка автоматически устанавливается в nil и высвобождает ячейку памяти

// unowned - Неуправляемая или безхозная ссылка аналогична weak-ссылке, но предполагает, что объект, на который она указывает, всегда существует во время жизни ссылки.

//Создать протокол переключатель с окончанием «able» как принято в свифт сообществе.
//В протокол перключатель добавить метод «переключать».(Все названия только на английском!)


protocol Switchable {
    mutating func switcher()
}

// Создать enum Switcher который конформит (conform) протокол переключатель и у которого 2 кейса off, on.

enum Switcher: Switchable {
    case on
    case off
    
    var isSwitchedOn: Bool {
        switch self {
        case .off:
            return false
        case .on:
            return true
        }
    }
    
    mutating func switcher() {
        self = (self == .on) ? .off : .on
    }
}

//Создать обьект с выбраным кейсом, далее вызвать у обьекта метод переключения который меняет off на on например.

var mySwitch: Switcher = .off
print(mySwitch.isSwitchedOn) // Вывод: false



// создать протокол movable с методом run, протокол shootable с методом shoot

protocol Movable {
    func move()
}


//Создать 2 класса и одну структуру, от каждого по 1 экземпляру, всё это сложить в 1 массив

protocol Shootable {
    func shoot()
}

//создать Human protocol у которого есть свойство name и который комфортит протоколы Movable и Shootable

protocol HumanProtocol: Movable, Shootable {
    var name: String { get }
}

//Создать класс Human подписаться на протокол Human Protocol и реализовать его , в методы добавить принты

class Human: HumanProtocol {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func move() {
        print("\(name) is moving.")
    }
    
    func shoot() {
        print("\(name) is shooting.")
    }
}


// Создать 2 класса и одну структуру, от каждого по 1 экземпляру, всё это сложить в 1 массив

protocol OneObject {
    func printing()
}

class Car: OneObject {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printing() {
        print("Марка автомобиля: \(name)")
    }
}

struct Animal: OneObject {
    var name: String
    
    func printing() {
        print("Тип животного: \(name)")
    }
}

struct Building: OneObject {
    var name: String
    
    func printing() {
        print("Тип постройки: \(name)")
    }
}

let car = Car(name: "Тойота")
let animal = Animal(name: "Собака")
let building = Building(name: "Дом")

var array: [OneObject] = [car, animal, building]
