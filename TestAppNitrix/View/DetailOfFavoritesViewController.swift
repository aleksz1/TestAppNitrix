//
//  DetailOfFavoritesViewController.swift
//  TestAppNitrix
//
//  Created by Иван on 04.02.2024.
//

import UIKit
import SDWebImage
import CoreData

final class DetailOfFavoritesViewController: UIViewController {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var releasedLabel: UILabel!
    
    // MARK: - Properties
    var movieFromFavorites: [Movie] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movieFromFavorites.first {
            titleLabel.text = movie.originalTitle
            releasedLabel.text = movie.releaseDate
            if let posterPath = movie.posterPath {
                let url = URL(string: "https://image.tmdb.org/t/p/w185" + posterPath)!
                imageView.sd_setImage(with: url, completed: nil)
            }
        }
    }
}
