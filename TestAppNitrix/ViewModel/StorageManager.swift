//
//  StorageManager.swift
//  TestAppNitrix
//
//  Created by Иван on 04.02.2024.
//

import CoreData
import UIKit

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var moviesList: [Movie] = []
    
    private init() {}
    
        func saveMovies(_ movies: [ResultsMovies]) {
            for movie in movies {
                save(movie.originalTitle, releaseDate: movie.releaseDate, posterPath: movie.posterPath ?? "")
            }
        }
    
    func fetchData() {
        let fetchRequest = Movie.fetchRequest()
        moviesList.removeAll()
        do {
            moviesList = try viewContext.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func save(_ originalTitle: String, releaseDate: String, posterPath: String) {
        let movieEntity = Movie(context: viewContext)
        movieEntity.originalTitle = originalTitle
        movieEntity.releaseDate = releaseDate
        movieEntity.posterPath = posterPath
        movieEntity.isFavorite = true
        
        do {
            try viewContext.save()
        } catch {
            print("Ошибка сохранения данных: \(error)")
    }
}
    
    func delete(_ movie: Movie) {
        viewContext.delete(movie)
        
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

