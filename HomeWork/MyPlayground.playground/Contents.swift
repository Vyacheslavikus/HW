import UIKit

//  Зайти и обязательно познакомиться с документацией. Выпишите в ДЗ 5 примеров.

//Создать 5 констант со СТРОКАМИ которые содержат цифры и посчитайте их используя новые инструменты.

let number1: String? = "1"
let number2: String? = "2"
let number3: String? = "3"
let number4: String? = "4"
let number5: String? = "5"

// Преобразование строк в числа и подсчет суммы
var total = 0

if let num1 = Int(number1 ?? ""), let num2 = Int(number2 ?? ""), let num3 = Int(number3 ?? ""), let num4 = Int(number4 ?? ""), let num5 = Int(number5 ?? "") {
    total = num1 + num2 + num3 + num4 + num5
}

if total > 0 {
    print("Сумма чисел: \(total)")
} else {
    print("Ошибка: Не удалось преобразовать значение в числа.")
}

// Cоздайте 3 константы со знаяением nil

let nilConstant1: String? = nil
let nilConstant2: Int? = nil
let nilConstant3: Double? = nil

// Создать 5 опциональных типов констант и установите им значения

let optionalString: String? = "Hello"
let optionalInt: Int? = 42
let optionalDouble: Double? = 3.14
let optionalBool: Bool? = true
let optionalArray: [String]? = ["Apple", "Banana", "Cherry"]

// Перечислите способы извлечения опционала с примерами (guard) не использовать

// 1)Принудительное извлечение (!):
// 2)Опциональное связывание:
// 3)Использование оператора объединения с nil (??):


//  Создайте опциональный массив Int’ов с значениями от 1 до Преобразуйте в новый массив добавив к каждому элементу букву «a». Выведите получившийся массив


//Дан массив number: [Int]? = [5, 3, 6, 8, 1, 2, 4]. Найти сумму элементов массива и вывести в консоль. Для вычисления суммы использовать функцию высшего порядка.

let numbers: [Int]? = [5, 3, 6, 8, 1, 2, 4]
if let validNumbers = numbers {
    let sum = validNumbers.reduce(0, +)
    print("Сумма элементов массива: \(sum)")
}

// Создайте несколько опциональных значений. С помощью «оператора объединения с nil» извлеките значение.

let optionalValue1: Int? = 42
let optionalValue2: Int? = nil
let optionalValue3: String? = "Hello"
let optionalValue4: String? = nil

let result1 = optionalValue1 ?? 42
let result2 = optionalValue2 ?? 0
let result3 = optionalValue3 ?? "Hello"
let result4 = optionalValue4 ?? "nil"

// Дан массив number: [Int]? = [5, 3, 6, 8, 1, 2, 4]. Найти сумму элементов массива и вывести в консоль. Для вычисления суммы использовать функцию высшего порядка.


let newNumbers: [String]? = ["5", "3", "шесть"]

if let validNumbers = numbers, validNumbers.count > 2 {
    var intArray: [Int] = []

    for number in validNumbers {
        if let intValue = Int?(number) {
            intArray.append(intValue)
        }
    }

    if !intArray.isEmpty {
        print(intArray)
    } else {
        print("В массиве нет целых чисел.")
    }
} else {
    print("Недостаточно элементов в массиве для преобразования.")
}



