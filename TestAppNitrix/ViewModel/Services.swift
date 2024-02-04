//
//  Services.swift
//  TestAppNitrix
//
//  Created by Иван on 03.02.2024.
//

import Foundation
import Alamofire

enum Link {
    case moviesUrl
    
    var url: URL {
        switch self {
        case .moviesUrl:
            return URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=2ccc9fcb3e886fcb5f80015418735095")!
        }
    }
}

final class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func reguestTrendingMovies(completion: @escaping(([ResultsMovies]) -> ())){
        
        AF.request(Link.moviesUrl.url)
            .validate()
            .responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(Movies.self, from: responce.data!) {
                let movies = data.results
                completion(movies)
            }
        }
    }
}


