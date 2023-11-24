import UIKit
 

//Найти информацию что такое наследование в Google, перефразировать эту информацию своими словами и вставить это в плейграунд в закомментировано" виде.
// Сделать то же самое с понятием Инкапсуляция.
// И так же с понятием полиморфизм.


// Итак, наследование это когда один класс - наследник или дочериний класс может наследовать использовать свойства и методы родительского класса (или супер класса). В классе наследники можно добавлять новые свойства и/или методы или переопределять существующие.

//Икапсуляция простыми словами.
//Это когда мы помещаем объект как будто бы в капсулу и сами решаем какой объём доступов к этому объекты мы даём для других пользователей. Будет ли он публичным или приватным, будет ли возможность его изменять или наша версия этого объекта будет неизменямой.

// Полиморфизм
//Это когда объекты разного типа реагируют на один и тот же запрос или команду своим, спецефичным способом. Т.е. буквально исаользуя названия полиморфизм можно сказать, что множество форм могут взаимодействовать в своей манере на один запрос/команду.


//-----------------------------------------------------------------------------------------------

//Создать класс "люди", в этом классе 4 property - "имя", "рост", "вес", "пол", а также будет иметь метод "say(говорит)".
//2) Создать subСlass (наследники) "повар", "менеджер", "борец" и переопределить метод "say(говорит)" в каждом из этих классов.

class People {
    
    let name: String
    let height: Int
    let weight: Double
    let sex: String
    
    init(name: String, height: Int, weight: Double, sex: String) {
        self.name = name
        self.height = height
        self.weight = weight
        self.sex = sex
    }
    
    func say() {
        print("говорит")
    }
}

class Cook: People {
    
    let occupation: String
    
    init(name: String, height: Int, weight: Double, sex: String, occupation: String) {
           self.occupation = occupation
           super.init(name: name, height: height, weight: weight, sex: sex)
    }
    
    override func say() {
        super.say()
        print("\(occupation) говорит: еда готова!")
    }
}

class Manager: People {
    
    let occupation: String
    
    init(name: String, height: Int, weight: Double, sex: String, occupation: String) {
           self.occupation = occupation
           super.init(name: name, height: height, weight: weight, sex: sex)
    }
    
    override func say() {
        super.say()
        print("\(occupation) говорит: когда уже там таска будет готова?")
    }
}

class Fighter: People {
    
    let occupation: String
    
    init(name: String, height: Int, weight: Double, sex: String, occupation: String) {
           self.occupation = occupation
           super.init(name: name, height: height, weight: weight, sex: sex)
    }
    
    override func say() {
        super.say()
        print("\(occupation) говорит: Эээ, пойдём раз на раз, я тебя сломаю! Эщкере!!!")
    }
}

//Создать по одному объекту(экземпляру) каждого класса и объединить их в массив.

let cook = Cook(
    name: "Александр",
    height: 180,
    weight: 99.5,
    sex: "мужчина",
    occupation: "Повар"
)

let manager = Manager(
    name: "Мария",
    height: 175,
    weight: 65.0 ,
    sex: "женский",
    occupation: "Мэнеджер"
)

let fighter = Fighter(
    name: "Имя Ибрагим вам о чём нибудь говорит?!",
    height: 184,
    weight: 73.7,
    sex: "мужчина",
    occupation: "Борец"
)

var allPerson = [cook, manager, fighter]

// В цикле “for in” пройти по всем элементам массива и вывести в консоль все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "say(говорит)"

for person in allPerson {
    print("Имя: \(person.name)")
    print("Рост: \(person.height)")
    print("Вес: \(person.weight)")
    print("Пол: \(person.sex)")
    person.say()
}

//Создать еще одного наследника от super Class, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам People.

class Surfer: People {
    
    let occupation: String
    let surfboardLength: Double
    
    init(name: String, height: Int, weight: Double, sex: String, occupation: String, surfboardLength: Double) {
        self.occupation = occupation
        self.surfboardLength = surfboardLength
        super.init(name: name, height: height, weight: weight, sex: sex)
    }
    
    override func say() {
        super.say()
        print("\(occupation) говорит: Ты только взгляни на мою доску!")
    }
}

let surfer = Surfer(
    name: "Димон",
    height: 187,
    weight: 80.0,
    sex: "мужской",
    occupation: "сёрфер",
    surfboardLength: 3.5
    )

allPerson = [cook, manager, fighter, surfer]

for person in allPerson {
    print("Имя: \(person.name)")
    print("Рост: \(person.height)")
    print("Вес: \(person.weight)")
    print("Пол: \(person.sex)")
    if let surfer = person as? Surfer {
        print("Занятие: \(surfer.occupation)")
        print("Длина доски для сёрфа: \(surfer.surfboardLength)")
    }
    person.say()
}

//Метод "say(говорит)" реализовать таким образом, чтобы перед тем как выполнить собственный method say, выполнялся сначала метод say класса People.

// Я внёс изменения в подклассы таким образом, что сначала выполняется метод Say родительского класса с помощью оператора super. и теперь это так и работает. Надеюсь правильно понял задание.

//Вывести все это в обратном порядке

let reversedPerson = allPerson.reversed()

for person in reversedPerson {
    print("Имя: \(person.name)")
    print("Рост: \(person.height)")
    print("Вес: \(person.weight)")
    print("Пол: \(person.sex)")
    if let surfer = person as? Surfer {
        print("Занятие: \(surfer.occupation)")
        print("Длина доски для сёрфа: \(surfer.surfboardLength)")
    }
    person.say()
}

//Создать класс "Марсианин" (не наследник класса people!) со своими собственными property (отличными от people) и методом "say" (отличным от people).

class Martian {
    
    let name: String
    let numberOfEyes: Int
    
    init(name: String, numberOfEyes: Int){
        self.name = name
        self.numberOfEyes = numberOfEyes
    }
    
    func say(){
        print("Говорит по - марсиански")
    }
}

//Унаследоваться от него и создать пару других классов (Инопланетян) с переопределенным методом "say".

class Digger: Martian {
    
    let type: String
    
    init(name: String, type:String, numberOfEyes: Int) {
        self.type = type
        super.init(name: name, numberOfEyes: numberOfEyes)
    }
    
    override func say() {
        print("Говорит по - марсиански что он \(type)")
    }
}

class Astronaut: Martian {
    
    let type: String
    
    init(name: String, type:String, numberOfEyes: Int) {
        self.type = type
        super.init(name: name, numberOfEyes: numberOfEyes)
    }
    
    override func say() {
        print("Говорит что он \(type), его забыли при экстренной эвакуации корабля Арес 3!")
    }
}

let digger = Digger(name: "Зворк", type: "Землеройка", numberOfEyes: 1)
let astronaut = Astronaut(name: "Марк Уотни", type: "Астронавт", numberOfEyes: 2)

let allMartians = [digger, astronaut]

//Объединить всех people и Марсианинов) в один массив.

let people: [People] = allPerson
let martian: [Martian] = allMartians

var allCreatures: [Any] = [people, martian]

if allCreatures[0] is [People] {
    for person in people {
        print("Этот типок с Земли: \(person.name)")
    }
}

if allCreatures[1] is [Martian] {
    for perosn in martian {
        print("А вот это марсианский типок: \(perosn.name)")
    }
}



