import UIKit


//  Создать цикл в цикле. В первом цикле интервал 200 раз во втором как дойдем до 15 выйти со всех циклов сразу.


outLoop: for i in 0...200 {
    innerLoop: for k in 0..<15 {
        print ("первый цикл: \(i), Вложенный цикл: \(k)")
        if k == 15 {
            break outLoop
        }
    }
}

// Создать обработку возраста в switch, если человеку от 6 до 17 то выводить, что ему пора нужно в школу, если от 18 до 25, то в универ и так далее, аж до пенсии.


let age = 40

switch age {
case 6...17:
    print("Вам пора в школу.")
case 18...25:
    print("Вам пора в университет.")
case 26...35:
    print("Пахай пока молодёж.")
case 35...60:
    print("Сильно не старайся,пусть молодые работают.")
case 61...:
    print("Вы на пенсии.")
default:
    print("Возраст не определен.")
}


// Сделайе предыдущее задание череp if else


if age >= 6 {
    if age <= 17 {
        print("Вам пора в школу.")
    }
}
else if age >= 18 {
    if age <= 25 {
        print("Вам пора в университет.")
    }
}
else if age >= 26 {
    if age <= 35 {
        print("Пахай пока молодёж.")
    }
}
else if age >= 36 {
    if age >= 60 {
        print("Сильно не старайся,пусть молодые работают.")
    }
}
else if age >= 61 {
    print("Вы на пенсии.")
}
else {
    print("Возраст не определен.")
}

// Создать switch, который принимает сразу точку по x и y например (1, 1) и написать условие если x,y по 0 то выводить x,y и написать, что это точка origin, если значение (1, 0), то выводим точку и говорим вы на оси x, (0, 1) вы на оси y, если x и y от -2 до 2 то писать вы внутри координат.


let x = 1
let y = 1

switch (x, y) {
case (0, 0):
    print("Точка (\(x), \(y)) - это точка origin.")
case (1, 0):
    print("Точка (\(x), \(y)) - вы на оси x.")
case (0, 1):
    print("Точка (\(x), \(y)) - вы на оси y.")
case (-2...2, -2...2):
    print("Точка (\(x), \(y)) - вы внутри координат.")
default:
    print("Точка (\(x), \(y)) не соответствует ни одному заданному условию.")
}


//Написать switch в котором 3 кейса 1,2,3 с принтами этих индексов. Когда мы передаем 1 индекс печатать принт 1 го кейса, а когда передаем 2 й индекс то печатать сразу принт 2- го и 3-го кейса.

let index = 2

switch index {
case 1:
    print("Это кейс 1.")
case 2:
    print("Это кейс 2.")
    fallthrough // Переход к следующему кейсу без проверки
case 3:
    print("Это кейс 3.")
default:
    print("Индекс не соответствует ни одному кейсу.")
}


// Придумать свой switch в котором будет 3 кейса и в одном из ник доп. условие с оператором where.


let value = 3

switch value {
case 1:
    print("Это кейс 1")
case 2:
    print("Это кейс 2")
case let x where x > 2:
    print("Это дополнительный кейс для значений больше 2")
default:
    print("Значение не соответствует ни одному кейсу")
}
