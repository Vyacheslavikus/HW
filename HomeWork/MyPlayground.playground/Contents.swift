import UIKit

//Создать любой generic для классов, структур, методов, перечислений (по 1 на каждый)

// Generic для класса

class Box<T> {
    var item: T?
    
    init(item: T?) {
        self.item = item
    }
    
    func addItem(_ newItem: T) {
        item = newItem
    }
}

//Generic для структуры

struct Pair<T, U> {
    let first: T
    let second: U
}

let numberAndString = Pair(first: 10, second: "Hello")
let anotherPair = Pair(first: true, second: 1.11)

// Generic для методов

func printingValue<T>(value: T) {
    print("Значение: \(value)")
}

// Generic для перечислений

enum Result<T> {
    case success(T)
    case failure(String)
}

let success = Result.success(1)
let failure = Result<Int>.failure("Ошибка")

switch success {
case .success(let value):
    print("Успех: \(value)")
case .failure(let error):
    print("Ошибка: \(error)")
}


//Написать функцию, которая принимает Generic объект и складывает в массив/словарь (на выбор)

func addToCollection<T>(element: T, intoArray array: inout [T]) {
    array.append(element)
}

//Создать класс, который сортирует массивы значений (на ваш выбор) 3 разными способами.

class Sorting {
    
    func bubbleSort<T: Comparable>(_ array: inout [T]) {
        let n = array.count
        guard n > 1 else { return }
        
        for i in 0..<n {
            for j in 0..<(n - i - 1) {
                if array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                }
            }
        }
    }
    
    func insertionSort<T: Comparable>(_ array: inout [T]) {
        let n = array.count
        guard n > 1 else { return }
        
        for i in 1..<n {
            let key = array[i]
            var j = i - 1
            
            while j >= 0 && array[j] > key {
                array[j + 1] = array[j]
                j -= 1
            }
            array[j + 1] = key
        }
    }
    
    func quickSort<T: Comparable>(_ array: inout [T], low: Int, high: Int) {
        if low < high {
            let partitionIndex = partition(&array, low: low, high: high)
            quickSort(&array, low: low, high: partitionIndex - 1)
            quickSort(&array, low: partitionIndex + 1, high: high)
        }
    }
    
    private func partition<T: Comparable>(_ array: inout [T], low: Int, high: Int) -> Int {
        let pivot = array[high]
        var i = low - 1
        
        for j in low..<high {
            if array[j] <= pivot {
                i += 1
                array.swapAt(i, j)
            }
        }
        array.swapAt(i + 1, high)
        return i + 1
    }
}


//Написать класс на свой вкус (любые методы, проперти) универсального типа. Используя extension, расширить класс, добавить сабскрипт.

class Container<T> {
    private var elements: [T] = []
    
    func add(_ element: T) {
        elements.append(element)
    }
    
    func removing(at index: Int) {
        guard index >= 0, index < elements.count else { return }
        elements.remove(at: index)
    }
    
    func geting(at index: Int) -> T? {
        guard index >= 0, index < elements.count else { return nil }
        return elements[index]
    }
}


extension Container {
    subscript(index: Int) -> T? {
        get {
            guard index >= 0, index < elements.count else { return nil }
            return elements[index]
        }
        set {
            guard let newValue = newValue, index >= 0 else { return }
            
            if index < elements.count {
                elements[index] = newValue
            } else {
                elements.append(newValue)
            }
        }
    }
}

