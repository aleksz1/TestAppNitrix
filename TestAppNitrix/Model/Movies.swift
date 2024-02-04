//
//  Movies.swift
//  TestAppNitrix
//
//  Created by Иван on 03.02.2024.
//

import Foundation

struct Movies : Codable {
    let page : Int
    let results : [ResultsMovies]
    let totalPages : Int
    let totalResults : Int
    
    enum CodingKeys: String, CodingKey {
        
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct ResultsMovies : Codable {
    let backdropPath : String?
    var originalTitle : String
    let overview : String
    var posterPath : String?
    var releaseDate : String
    
    enum CodingKeys: String, CodingKey {
        
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
