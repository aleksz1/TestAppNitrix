//
//  DetailViewController.swift
//  TestAppNitrix
//
//  Created by Иван on 03.02.2024.
//

import UIKit
import SDWebImage

final class DetailViewController: UIViewController {
    // MARK: - Private IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var originalTitle: UILabel!
    @IBOutlet private weak var overview: UILabel!
    @IBOutlet private weak var releaseDate: UILabel!
    
    // MARK: - Properties
    var movie: ResultsMovies?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let posterPath = movie?.posterPath, posterPath != "" {
            let url = URL(string: "https://image.tmdb.org/t/p/w185" + posterPath)!
            imageView.sd_setImage(with: url, completed: nil)
        }
        originalTitle.text = movie?.originalTitle
        overview.text = movie?.overview
        releaseDate.text = movie?.releaseDate
    }
}
