import UIKit
var view: UIView
var deviceModels: [String]

// Описать несколько структур – любой̆ легковой̆ автомобиль и любой̆ грузовик.
//1 Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный̆ объем багажника.
//2 Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз
//3 Добавить в структуры метод с одним аргументом типа перечисления, который̆ будет менять
//свойства структуры в зависимости от действия.
//4 Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//5 Положить объекты структур в словарь как ключи! названия как строки, например:
//var dict = [structCar: "structCar"]


struct Sedan: Hashable {
    let brand: String
    let dateOfIssue: Int
    let trunkVolume: Int
    var engineWork: Bool
    var windowOpen: Bool
    var trunkIsFull: Bool
    
    enum CarAction {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case loadTrunk(Int)
        case unloadTrunk(Int)
    }
    
    mutating func perform(action: CarAction) {
        switch action {
        case .startEngine:
            if !engineWork {
                engineWork = true
                print("Двигатель запущен.")
            } else {
                print("Двигатель уже запущен.")
            }
        case .stopEngine:
            if engineWork {
                engineWork = false
                print("Двигатель заглушен.")
            } else {
                print("Двигатель уже заглушен.")
            }
        case .openWindow:
            if !windowOpen {
                windowOpen = true
                print("Окна открыты.")
            } else {
                print("Окна уже открыты.")
            }
        case .closeWindow:
            if  windowOpen {
                windowOpen = false
                print("Окна закрыты.")
            } else {
                print("Окна уже закрыты.")
            }
        case .loadTrunk:
            if !trunkIsFull {
                trunkIsFull = true
                print("Груз загружен в багажник.")
            } else {
                print("Багажник уже заполнен.")
            }
        case .unloadTrunk:
            if trunkIsFull {
                trunkIsFull = false
                print("Груз выгружен из багажника.")
            } else {
                print("Багажник уже пуст.")
            }
        }
        
    }
}

struct Truck: Hashable {
    let brand: String
    let dateOfIssue: Int
    let trunkVolume: Int
    var engineWork: Bool
    var windowOpen: Bool
    var trunkIsFull: Bool
    
    enum CarAction {
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case loadTrunk
        case unloadTrunk
    }
    
    mutating func perform(action: CarAction) {
        switch action {
        case .startEngine:
            if !engineWork {
                engineWork = true
                print("Двигатель запущен.")
            } else {
                print("Двигатель уже запущен.")
            }
        case .stopEngine:
            if engineWork {
                engineWork = false
                print("Двигатель заглушен.")
            } else {
                print("Двигатель уже заглушен.")
            }
        case .openWindow:
            if !windowOpen {
                windowOpen = true
                print("Окна открыты.")
            } else {
                print("Окна уже открыты.")
            }
        case .closeWindow:
            if  windowOpen {
                windowOpen = false
                print("Окна закрыты.")
            } else {
                print("Окна уже закрыты.")
            }
        case .loadTrunk:
            if !trunkIsFull {
                trunkIsFull = true
                print("Груз загружен в багажник.")
            } else {
                print("Багажник уже заполнен.")
            }
        case .unloadTrunk:
            if trunkIsFull {
                trunkIsFull = false
                print("Груз выгружен из багажника.")
            } else {
                print("Багажник уже пуст.")
            }
        }
        
    }
}


let volvo = Sedan(
    brand: "Вольво",
    dateOfIssue: 2019,
    trunkVolume: 500,
    engineWork: true,
    windowOpen: false,
    trunkIsFull: false
)

let caterpillar = Truck(
    brand: "Катерпилляр",
    dateOfIssue: 2017,
    trunkVolume: 3000,
    engineWork: true,
    windowOpen: true,
    trunkIsFull: true
)

let cars: [AnyHashable: String] = [
    volvo: "Вольво",
    caterpillar: "Катерпилляр"
]



//Набрать код на белом скрине, понять в чем там проблема и решить эту проблему


// Классы вызывают друг к другу и по этому остаются активными. необходимо сделать сслыки слабыми чтобы они прееставали быть активными , когда нет ссылок из вне классов, а они вызывают только сами себя. Я сделал слабой ссылку на "nyCar"


class Car {
    
    var driver: Man?
    
    deinit {
        print("Машина удалена из памяти")
    }
    
}

class Man {
    
    weak var myCar: Car?
    
    deinit{
        print("Мужчина удалён из памяти")
    }
}

var car: Car? = Car()
var man: Man? = Man()

car?.driver = man

man?.myCar = car

car = nil
man = nil

// У нас есть класс мужчины и его паспорт. Мужчина может родиться и не иметь паспорта, но паспорт выдается конкретному мужчине и не может выдаваться без указания владельца. Чтобы разрешить эту проблему, ссылку на паспорт у мужчины сделаем обычной опциональной, а ссылку на владельца у паспорта – константой. Также добавим паспорту конструктор, чтобы сразу определить его владельца. Таким образом, человек сможет существовать без паспорта, сможет его поменять или выкинуть, но паспорт может быть создан только с конкретным владельцем и никогда не может его сменить. Повторить все, что на черном скрине и решить проблему соблюдая все правила!


// Можно вместо использования прямых ссылок на классы использовать замыкания (как раз так и переделал) , тогда класы будут обращатся только при необходимости.

class NewMan {
    var passport: (() -> Passport?)?
    
    deinit {
        print("Мужчина удалён из памяти")
    }
}
class Passport {
    let man: () -> NewMan
    
    init(man: @escaping() -> NewMan) {
        self.man = man
    }
    
    deinit {
        print("Паспорт удалён из памяти")
    }
}

var newman: NewMan? = NewMan()
var passport: Passport? = Passport { newman! }
newman!.passport = { passport }

passport = nil
newman = nil


//Создать класс «Ученик».
//Добавить свойство класса, в котором будет текущая дата.
//Добавить метод класса, которое выводит текст этого задания в виде многострочного литерала.

class Student {
    let currentDate = Date()
    
    func printingText() -> String {
        return """
        Создать класс «Ученик».
        Добавить свойство класса, в котором будет текущая дата.
        Добавить метод класса, которое выводит текст этого задания в виде многострочного литерала.
        """
    }
}

let student = Student()
print(student.printingText())

//Создать класс «FlowСontrol»
//Добавить в класс 5 функций, каждая из которых будет использовать отдельный оператор управления потоком.
//(В одной массив прогоняется через цикл for, в другой через while, в третьей через repeat while) и т.д.
//Каждая функция возвращает результат своей работы. Создать enum c кейсами под каждую функцию.
//Создать экземпляр класса и продемонстрировать работу каждой функции используя значения перечисления.
//Функции напрямую управления потоком должны быть недоступными для вызова вне класса.


class FlowControl {
    
    enum FunctionResult {
        case forLoopResult(Int)
        case whileLoopResult(Int)
        case repeatWhileLoopResult(Int)
        case ifGuardResult(String)
        case switchStatementResult(SwitchResult)
    }
    enum SwitchResult {
        case one
        case two
        case three
        case four
        case five
        case noResult
    }
    
    private func loopingForIn() -> FunctionResult {
        var result = 0
        for index in 1...5 {
            result += index
        }
        return.forLoopResult(result)
    }
    
    private func loopingWhile() -> FunctionResult {
        var sum = 0
        var step = 1
        while step <= 5 {
            sum += step
            step += 1
        }
        return.whileLoopResult(sum)
    }
    
    private func loopingRepeatWhile() -> FunctionResult {
        var sum = 0
        var step = 1
        repeat {
            sum += step
            step += 1
        } while step <= 5
        return.repeatWhileLoopResult(sum)
    }
    
    private func loopingIfGuard(value: Int) -> FunctionResult {
        guard value > 0 else {
            return .ifGuardResult("значение меньше нуля")
        }
        return .ifGuardResult("значение больше нуля")
    }
    
    private func loopingSwitch(value: Int) -> FunctionResult {
        switch value {
        case 1:
            return .switchStatementResult(.one)
        case 2:
            return .switchStatementResult(.two)
        case 3:
            return .switchStatementResult(.three)
        case 4:
            return .switchStatementResult(.four)
        case 5:
            return .switchStatementResult(.five)
        default:
            return .switchStatementResult(.noResult)
        }
    }
    
    func executingFunctions() -> [FunctionResult] {
        return [
            loopingForIn(),
            loopingWhile(),
            loopingRepeatWhile(),
            loopingIfGuard(value: 2),
            loopingSwitch(value: 4),
        ]
    }
    
}

let flowControl = FlowControl()
let results = flowControl.executingFunctions()

for result in results {
    switch result {
    case .forLoopResult(let sum):
        print("Результат цикла for \(sum)")
    case .whileLoopResult(let sum):
        print("результат цикла while \(sum)")
    case .repeatWhileLoopResult(let sum):
        print("результат цикла reapeat-whie \(sum)")
    case .ifGuardResult(let massage):
        print("результат цикла \(massage)")
    case .switchStatementResult(let swtchResult):
        print("результат цикла switch \(swtchResult)")
    }
}

