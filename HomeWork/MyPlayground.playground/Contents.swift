import UIKit
var view: UIView
var deviceModels: [String]

//Создать класс "Students", добавить ему property: dateOfBirth, skills.


class Students {
    
    var dateOfBirth: String
    var skills: [String]
    
    init(dateOfBirth: String , skills: [String]) {
        self.dateOfBirth = dateOfBirth
        self.skills = skills
    }
}

//Написать структуру "CreateTriangle",с двумя свойствами - угол A, угол C. И создать 2 вычисляемых свойства - те же угол А, угол С.
//И если мы записываем значения в эти углы - результатом должно быть значение третьего угла.
//Для простоты можно взять прямоугольный треугольник, сумма углов которого равна 180 градусов.

// Т.к. треугольник прямоугольный то принимаем, что угол В всегда равен 90 градусам.
// В условии задачи написано создать 2 свйоства с углами и 2 вычисляемых свойство,
// но для проверки правильности ввода, чтобы не повторять код дважды, я напишу метод.



struct CreateTriangle {

    var angleA: Double = 10.0
    var angleC: Double = 80.0
    var angleB: Double = 90.0
    
    func chekingAngles() -> Bool {
        let totalAngles = angleA + angleC
        print(totalAngles)
        return 1...90 ~= totalAngles
    }

    var computeredAngleA: Double {
        get {
            return angleA
        }
        set {
            if newValue <= 0 || newValue >= 91 {
                print ("Недопустимое значение угла!")
                
            } else if chekingAngles() {
                angleA = newValue
                angleC = 90.0 - angleA
            } else {
                print ("Ошибка: сумма углов больше 180 градусов")
            }
        }
    }
    

    var computeredAngleC: Double {
        get {
            return angleC
        }
        set {
            if newValue <= 0 || newValue >= 91 {
                print("Недопустимое значение угла!")
            } else if chekingAngles() {
                angleC = newValue
                angleA = 90 - angleC
            } else {
                print ("Ошибка: сумма углов больше 180 градусов")
            }
        }
    }
}



var triangle = CreateTriangle()


triangle.computeredAngleC = 800


print ("Угол А: \(triangle.computeredAngleA) градусов")
print ("Угол В: 90.0 градусов")
print ("Угол C: \(triangle.computeredAngleC) градусов")



// Создать структуру "Резюме", у которой есть такие свойства:
//- Фамилия,
//- Имя.
//- Должность,
//- Опыт,
//- Контактные данные(телефон, емейл),
//- О себе(можно записать какие-то пару предложений на выбор)


struct Resume {
    
    var lastName: String = ""
    
    
    var computedLastName: String {
        get {
                   return lastName
               }
        set {
            if !newValue.isEmpty {
                lastName = newValue.capitalized
            }
        }
    }
    
    var firstName: String = ""

    var computedFirstName: String {
        get {
            return firstName
        }
        set {
            firstName = newValue.capitalized
        }
    }
    
    
    var occupation: String
    var expierence: String
    var contactDetails: [Any]
    var coverLetter: String
}

var resume = Resume(
    lastName: "болванин" ,
    firstName: "иван" ,
    occupation: "разработчик" ,
    expierence: "5 лет" ,
    contactDetails: [+79111382058 , "krasavchik@ya.ru"] ,
    coverLetter: "Как же я силён, как мощны мои лапищи!"
    )

resume.computedLastName = "болванин"
resume.computedFirstName = "Иван"
print("Фамилия: \(resume.computedLastName)")
print("Имя: \(resume.computedFirstName)")
print("Должность: \(resume.occupation)")
print("Опыт: \(resume.expierence)")
print("Контактные данные: \(resume.contactDetails)")
print("О себе: \(resume.coverLetter)")

// Задание на закрепление предыдущих тем: Создать журнал, что б можно было писать имя, фамилию и оценку
//Поставить ограничения: имя и фамилия не выше 15 символов каждое.
//И оценка не выше 5.
//Если везде значения превышаться выдавать об этом Сообщения в консоль.



struct Journal {
    
    var firstName: String
    var lastName: String
    var grade: Int
    
    var computerFirstName: String {
        get {
            return firstName
        }
        set {
            if newValue.count <= 15 {
                firstName = newValue
            } else {
                print("Ошибка: имя не может содержать более 15 символов")
            }
        }
    }
      
    var computerLastName: String {
        get {
            return lastName
        }
        set {
            if newValue.count <= 15 {
                lastName = newValue
            } else {
                print("Ошибка: фамилия не может содержать более 15 символов")
            }
        }
    }
    
    var computerGrade: Int {
        get{
            return grade
        }
        set {
            if newValue <= 5 {
                grade = newValue
            } else {
                print("Ошибка: оценка не может быть больше 5")
            }
        }
    }
}


var journal = Journal(firstName: "", lastName: "", grade: 0)

journal.computerFirstName = "Ванёк"
journal.computerLastName = "валфцвптйуктмжйуотмждоуатмоутамждуфотмфотм"
journal.computerGrade = 7

print("Имя: \(journal.computerFirstName)")
print("Фамилия: \(journal.computerLastName)")
print("Оценка: \(journal.computerGrade)")


//Написать класс, в котором есть 4 функции: -пустая, которая просто выводит сообщение через print,
//- которая принимаете параметры и выводит их в консоль,
//- которая принимает и возвращает параметры.
//- которая принимает замыкание и распечатывает результаты в консоль


class MyClass {

    func printerFunction() {
        print("Это пустая функция")
    }

    func takingFunction(_parameters: Any...) {
        for parameter in _parameters {
            print("Это любой параметр из функции \(parameter)")
        }
    }

    func requestAndResponsingFunction(_parametrs: Any...) -> Any {
        return _parametrs
    }

    func functionWithClosure(_ closure:() -> ()) {
        print("Функция с кложурой")
        closure()
    }
}


// Создать класс журнал с 1 массивом и 2 мя методами, удалить оценку и поставить оценку.
// Создать в этом же классе метод расписание который в параметр принимает енам из 3 х кейсов утро, обед, вечер.



class School {

    var rate: [Int] = []

   
    init(rate: [Int]) {
        self.rate = rate
      
    }

    func addRate(_ number: Int) {
        rate.append(number)
        print("Добавлена оценка \(number)")
    }


    func removingRate(_ number: Int) {
        if let indexToRemove = rate.firstIndex(of: number) {
            rate.remove(at: indexToRemove)
            print("Оценка \(number) удалена.")
        } else {
            print("Оценка \(number) не найдена.")
        }
    }
    
    enum DayTime {
        case morning
        case afternoon
        case evening
    }
    
    func shedule(time: DayTime) {
        switch time {
        case .morning:
            print("Приходи в школу утром.")
        case .afternoon:
            print("Приходи в школу днём.")
        case .evening:
            print("Приходи в школу вечером.")
        }
    }
    
}

var mySchool = School(rate: [5])

mySchool.addRate(5)

mySchool.shedule(time: .morning)
mySchool.shedule(time: .afternoon)
mySchool.shedule(time: .evening)
