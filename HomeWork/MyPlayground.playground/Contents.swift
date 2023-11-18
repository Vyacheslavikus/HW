import UIKit
var view: UIView


// Создать класс родитель и 2 класса наследника.

class Main {
    var father = 1
    var mother = 2
}

class Side: Main {
    var firstSon = "First"
}

class SecondSide: Main {
    var secondSon = "Second"
}

// Написать программу, в которой создать класс *House* в нем несколько свойств - *width*, *height* и несколько методов - *create*(выводит произведение свойств),*destroy*(отображает в принте что дом уничтожен).

class House {
    var width: Int
    var height: Int
    
    init(width: Int , height: Int) {
        self.width = width
        self.height = height
    }
    
    func create() {
        let area = width * height
        print("Произведение свойств \(area)")
    }
    func destroy(){
        print("Дом уничтожен")
    }
}

var myHouse = House (width: 50, height: 10)
myHouse.create()
myHouse.destroy()

//Создайте класс с методом, который сортирует массив учеников.

class Students{
    var students: [String] = []

    init(students: [String]) {
        self.students = students
    }
    func sortedStudent() {
        students.sorted()
    }
}

let listStudents = Students(students: ["Александр" , "Екатерина" , "Михаил" , "Ольга" , "Иван" , "Дрочеслав"])

listStudents.sortedStudent()

for students in listStudents.students {
      print(students)
}

// Написать свою структуру и класс, пояснить в комментариях - чем отличаются структуры от классов.


//-------------------- Для начала создаю структуру
struct NewHouse {
    var adres: String
    
    func housePrinting() {
        print("Дом по адресу: \(adres)")
    }
}

let myNewHouse = NewHouse(adres: "Pushkin street")
myNewHouse.housePrinting()


//-------------------- Теперь создадим класс

class Names {
    var names: [String] = []
    
    init (names: [String]) {
        self.names = names
    }
    
    func printingNames() {
        for name in names {
            print("Имя из списка: \(name)")
        }
    }
}

let myNames = Names(names: ["Александр", "Екатерина", "Михаил", "Ольга", "Глубокослав"])
myNames.printingNames()


//
//Чем отличаются классы от структур:
//
//1) Ицнициализация
//Классы имеют инициализаторы / деинициализаторы, тогда как в структурах инициализотры автоматически создаются компилятором ( в компиляторе(?))
//
//2) Наследование
//Классы поддерживают наследование, структуры не поддерживают
//
//3)Типы
//Классы - сылочный тип. Классы не копируются. При передаче будет ссылка на существующий класс.
//Стурктуры - тип значения. Значения копируют. при передаче создаётся копия и вы работаете с новой струткурой.



//Обьяснить в коментариях есть ли у классов множественное наследование, и пояснить что это.
//
//Мнодественное наследование - это свойсво наследовать свойства и типы от нескольких родительских классов.myNewHouse
//классы не поддерживают мнодественное наследование




//Обьяснить может ли структуры наследоваться.
//Стурктуры не могут наследоваться.
//Структуры, обчно, используют для создания простых типов данных и не имеют подклассов или родительских классов
