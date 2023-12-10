import UIKit

//Сделать класс Люди, у класса будут проперти родственники, соседи и т.д. (все опциональные).
//Создать нужно от 15 человек.
//Посчитать, сколько у этого человека двоюродных братьев, троюродных сестёр, теть, дядь, и т.д.

class People {
    var relatives: [String]?
    var neighbours: [String]?
    
    init(relatives: [String]?, neighbours: [String]?) {
        self.relatives = relatives
        self.neighbours = neighbours
    }
    
    func counterRelateves() -> Int {
        if let relativesCount = relatives?.count {
            return relativesCount
        } else {
            return 0
        }
    }
}

let people = People(
    relatives: [
        "брат",
        "сестра",
        "двоюродный дядя",
        "тётя",
        "дядя",
        "золовка",
        "девярь",
        "тесть",
        "тёща",
        "свекровь",
        "свёкр"
    ],
    neighbours: [
        "соседка сверху",
        "соседка снизу",
        "сосед сверху",
        "сосед снизу"
    ])
// Создать класс животные и проперти - корова, коза собака и т.д.
// Создать класс растения и проперти - трава, цветы и т.д.


class Animal {
    var animals: [String]?
    
    init(animals: [String]?) {
        self.animals = animals
    }
}

let animal = Animal(animals: ["Корова", "Козлёл", "Собака"])

class Plant {
    var plants: [String]?
    
    init(plants: [String]?) {
        self.plants = plants
    }
}
let plant = Plant(plants: ["Трава", "Цветы", "Деревья"])

//Положить все классы массив и отсортировать по алфавиту и по классу - Люди - животные - растения

var earth: [Any] = [people, animal, plant]


earth.sort {
    if let _ = $0 as? People, let _ = $1 as? People {
        return true
    } else if let _ = $0 as? Animal, let _ = $1 as? Animal {
        return true
    } else if let _ = $0 as? Plant, let _ = $1 as? Plant {
        return true
    } else {
        return false
    }
}


for species in earth {
    if species is People {
        print("Родственники: \(people.relatives ?? []), соседи: \(people.neighbours ?? [])")
    } else if species is Animal {
        print("Животные: \(animal.animals ?? [])")
    } else {
        print("Растения: \(plant.plants ?? [])")
    }
}


