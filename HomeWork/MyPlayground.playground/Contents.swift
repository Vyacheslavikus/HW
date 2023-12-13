import UIKit

//Я как заказчик даю вам разработчику задания сделать : Библиотеку книг и видео библиотеку фильмов Реализовать:
//.1 Возможность добавлять новые книги и фильмы и после добавления должна происходить автоматическая сортировка по алфавиту в пределах жанра. -----------------
//.2 Метод- "Sort by mood" - фильмы должны быть отсортировать по настроению. --------------
//.3 Такой же метод придумать для книг. -----------
//.4 Возможность удалять книги. ----------------
//.5 Выводить количество фильмов и книг в библиотеке -----------
//.6 Выводить количество книг по жанрам --------------
//.7 Выводить количество фильмов по жанрам -------------
//.8 Выводить уведомление о местонахождении книги, фильма (на руках, в библиотеке) -----------------
//.9 У каждой книги и фильма должны быть запись о людях, бравших ее ранее с указанием имени, даты выдачи и даты возврата. --------------
//.10 Метод, который выводит адрес библиотеки и контактные данные. ------------------
//.11 Одному человеку запрещается иметь на руках более 5 книг, и более 3 фильмов. ----------------

enum ItemStatus {
    case available
    case borrowed(name: String, dateBorrowed: Date, returnDate: Date?)
}

class Book {
    let title: String
    let genre: String
    let author: String
    let mood: String
    let borrowers: [(name: String, borrowedDate: Date, returnDate: Date)] = []
    var status: ItemStatus = .available
    
    init(title:String, genre:String, mood:String, author:String) {
        self.title = title
        self.genre = genre
        self.mood = mood
        self.author = author
    }
    
    func chekcingAvailabilitu() -> ItemStatus {
        return status
    }
}

class Movie {
    let title: String
    let genre: String
    let director: String
    let mood: String
    let borrowers: [(name: String, borrowedDate: Date, returnDate: Date)] = []
    var status: ItemStatus = .available
    
    init(title:String, genre:String, director:String, mood:String) {
        self.title = title
        self.genre = genre
        self.director = director
        self.mood = mood
    }
    
    func chekcingAvailabilitu() -> ItemStatus {
        return status
    }
}

class Library {
    var booksByGenre: [String: [Book]] = [:]
    var moviesByGenre: [String: [Movie]] = [:]
    var books: [Book] = []
    var movies: [Movie] = []
    var addressLibrary: String = "Санкт-Петербург, ул.Пупкина, д.Залупкина"
    var contactInfo: String = "Телефон/факс: 8-812-123-45-67, эл.почта: Netvoye@delo.ru"
    
    init(addressLibrary: String, contactInfo: String) {
        self.addressLibrary = addressLibrary
        self.contactInfo = contactInfo
    }
    
    func addBook(_ book: Book) {
        books.append(book)
        
        if booksByGenre[book.genre] == nil {
            booksByGenre[book.genre] = [book]
        } else {
            booksByGenre[book.genre]?.append(book)
            booksByGenre[book.genre]?.sort { $0.title < $1.title }
        }
    }
    
    func addMovie(_ movie: Movie) {
        movies.append(movie)
        
        if moviesByGenre[movie.genre] == nil {
            moviesByGenre[movie.genre] = [movie]
        } else {
            moviesByGenre[movie.genre]?.append(movie)
            moviesByGenre[movie.genre]?.sort { $0.title < $1.title }
        }
    }
    
    func sortBookByMood() {
        books.sort {$0.mood < $1.mood}
    }
    
    func sortMovieByMood() {
        movies.sort {$0.mood < $1.mood}
    }
    
    func removeBook(_ book: Book) {
        if let index = books.firstIndex(where: { $0.title == book.title }) {
            books.remove(at: index)
        } else {
            print("Такой книги не существует в библиотеке")
        }
    }
    
    func countingBooks() -> Int {
        return books.count
    }
    
    func countingMovie() -> Int {
        return movies.count
    }
    
    func countingBooksByGenre() -> [String: Int] {
        var countBookByGenre: [String: Int] = [:]
        for book in books {
            countBookByGenre[book.genre, default: 0] += 1
        }
        return countBookByGenre
    }
    
    func countingMovieByGenre() -> [String: Int] {
        var countMovieByGenre: [String: Int] = [:]
        for movie in movies {
            countMovieByGenre[movie.genre, default: 0] += 1
        }
        return countMovieByGenre
    }
    
    func printingAdressAndContacts() {
        print("Адрес библиотеки: \(addressLibrary). Контактные данные: \(contactInfo)")
    }
    
    func checkingBorrowLimit(userBooks: Int, userMovies: Int) -> Bool {
        return userBooks <= 5 && userMovies <= 3
    }
    
}

