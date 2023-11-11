import UIKit


//Написать сортировку массива с помощью замыкания, сначала в одну сторону, затем в другую. Вывести всё в консоль.

let names = ["Анна", "Иван", "Екатерина", "Максим", "Ольга", "Павел", "Светлана", "Александр", "Мария", "Дмитрий"]



let sortedNames = names.sorted { (s1:String , s2:String) -> Bool in

    return s1 < s2
}

print(sortedNames)

let newNames = names.sorted { (a1, a2) in a1 > a2 }

print(newNames)

// Создать метод который запрашивает имена друзей, после этого имена положить в массив. Массив отсортировать по количеству букв в имени.


var friends: [String] = []

func addFriend(_ newFriend: String) {
    friends.append(newFriend)
}

addFriend("Евгений")
addFriend("Сергей")

let sortedFriends = friends.sorted { (a0, a1) in a0.count < a1.count }

for friend in sortedFriends{
        print (friend)
}


//Написать что такое хвостовое замыкание. Привести пример.
"""
Это вид замыканий, который можно опустить за пределами скобок, когда оно является последним аргументом функции.
"""
let nambers = [1,2,3,4,5]

let squaredNumbers = nambers.map { $0 * $0 }

print(squaredNumbers)


//Написать что такое сбегающее замыкание. Привести пример.
"""
Это замыкание, которое может выйти за пределы области видимости, в которой оно было создано, и продолжить существование после завершения выполнения охватывающей функции.
Замыкания по умолчанию являются сбегающими, если вы явно не помечаете их как небегающие с использованием атрибута @escaping.

"""

func someOperation(completion: @escaping () -> Void)  {
    print("Тут мы выполняем какие-то операции")
    completion()
}

someOperation {
    print("Оперции завершены")
}

// Написать что такое autoclosures. Привести пример.
"""
Это замыкания, которые автоматически создаются для заключения выражения, которое было передано в качестве аргумента функции. Такие замыкания не принимают никаких аргументов при вызове и возвращают значение выражения, которое заключено внутри нее. Синтаксически можно опустить круглые скобки функции вокруг параметров функции, просто записав обычное выражение вместо явного замыкания.
"""

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: { customersInLine.remove(at: 0) } )

print(customersInLine)


//Создайте переменную типа ()->(). В теле кложуры создайте словарь (типы значений на ваш выбор) из 10 элементов и распечатайте пары (ключ: значение). Вызовите ниже вашу кложуру

let newClosure: ()->() = {
    let newDictionary = ["apple": 5, "banana": 3, "orange": 7, "grape": 8, "kiwi": 4, "pear": 6, "cherry": 12, "watermelon": 2, "strawberry": 10, "pineapple": 3]
    for (fruit, quantity) in newDictionary {
        print("\(fruit): \(quantity)")
    }
            
}

newClosure()

//Создать массив из 10 элементов с помощью map каждый элемент умножить на 10, преобразовать в массив String с помощью compactMap, отфильтровать c помощью .filter. Оставить значения с количеством символов больше 2. Вывести результат в консоль.


let array = [0,1,2,3,4,5,6,7,8,9]

let multipliedArray = array.map {$0*10}

let stringArray = multipliedArray.compactMap {String($0)}

let filtredArray = stringArray.filter {$0.count > 1}


print(array)
print(multipliedArray)
print(stringArray)
print(filtredArray)


// Создать кложуру которая принимает коэффициенты квадратного уравнения и возвращает его корни. Для примеры решаем это уравнение: x2 − 8x + 12 = 0;


let solver : (Double,Double,Double) -> (Double?,Double?) = {
    a,b,c in
    let discriminant = b*b - 4*a*c
    
    if discriminant < 0 {
        return (nil,nil)
    } else if discriminant == 0 {
        let root0 = -b / (2*a)
        return(root0,root0)
    } else {
        let root1 = -b + (sqrt(discriminant)/(2*a))
        let root2 = -b - (sqrt(discriminant)/(2*a))
        return (root1,root2)
    }
}

let equationValue = (1.0,8.0,12.0)
let roots = solver(equationValue.0,equationValue.1,equationValue.2)


if let root1 = roots.0, let root2 = roots.1 {
    print("Корни уравнения: \(root1), \(root2)")
} else {
    print("Уравнение не имеет корней")
}


// Вызовите ниже кложуру и в ее теле вывести произвольный текст. Преобразовать функцию с кложурой на скрине к функции с автокложурой. Вызвать и в теле вывести произвольный текст. Описать разницу между двумя вариантами.


func closureExample(saySomething: () -> ()) {
    saySomething ()
}

// делаю замыкание с произвольным текстом

closureExample {print("Произвольный текст")}

// Преобразую в автозамыкание, вызываю и в теле пижу произвольный текст

func autoClosureExample(saySomething: @autoclosure () -> ()){
    saySomething ()
}

autoClosureExample (saySomething:
                        ({print("Произвольный текст")}()
                        )
)

"""
// Написать функцию принимающую два параметра: первый параметр [Int] второй замыкание (_ result: [String] -> ()) переданный массив преобразовать к массиву String и вернуть в замыкании. Вызвать функцию и распечатать полученный результат в консоль.Функцию вызвать 3 раза:
1) В ПОЛНОМ синтаксисе, c указанием типа замыкания, замыкание внутри скобок функции)
2) С неявным возвратом значения (без указания типа), выносом за скобки
3) С сокращенным имени параметра ($0), выносом за скобки
"""

func convertArray (_ intArray:[Int], _ result: ([String]) -> () ){
    let stringArray = intArray.map {String($0)}
    result(stringArray)
}

// первый способ

convertArray([1,2,3,4,5], {(result: [String]) -> () in
    print("Полный синтаксис \(result)")
})

// второй способ

convertArray([5,4,3,2,1]) {result in
    print("Неявный вызов \(result)")
}

//третий способ

convertArray([1,2,1,2,1,2]) {
    print("Вызов с скоращением имени параметра \($0)")
}

//Написать функцию которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами.


func newDictionary<Key, Value>(_ dictionary: [Key:Value]) -> String {
    var resultString = " "
    for (key,value) in dictionary {
        resultString += "Key :\(key), Value : \(value)"
    }
        return resultString
}

let myDictionary = ["odnoko":1 , "dvoko":2 , "troko":3]
let result = newDictionary(myDictionary)

print(result)

//Написать функцию, которая принимает пустые массивы(один строковый, второй - числовой) и проверяет их: если пустой - то добавить значения и вывести в консоль.


