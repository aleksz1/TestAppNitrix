//
//  TabOneViewController.swift
//  TestAppNitrix
//
//  Created by Иван on 03.02.2024.
//

import UIKit
import SDWebImage
import CoreData

final class ChildViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // MARK: - Private properties
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 160, height: 230)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    private var moviesList: [ResultsMovies] = []
    private let storageManager = StorageManager.shared
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MoviesCell.self, forCellWithReuseIdentifier: "cell")
        setupCollectionView()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        NetworkManager.shared.reguestTrendingMovies { movies in
            self.moviesList = movies
            self.collectionView.reloadData()
        }
        collectionView.delegate = self
        view.backgroundColor = .white
    }
    
    // MARK: - Private Methods
    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    @objc private func handleLongPress(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            guard let indexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else { return }
            let movie = moviesList[indexPath.row]
            storageManager.save(movie.originalTitle, 
                                releaseDate: movie.releaseDate,
                                posterPath: movie.posterPath ?? "")
            FavoritesViewController().fetchFavoriteMovies()
            let alert = UIAlertController(
                title: "Фильм сохранен",
                message: "Фильм \"\(movie.originalTitle)\" добавлен в избранное",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default))
            present(alert, animated: true)
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MoviesCell
        let movie = moviesList[indexPath.row]
        cell.label1.text = movie.originalTitle
        cell.label2.text = movie.releaseDate
        if let posterPath = movie.posterPath, posterPath != "" {
            let url = URL(string: "https://image.tmdb.org/t/p/w185" + posterPath)!
            cell.imageView.sd_setImage(with: url, completed: nil)
        }
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        cell.addGestureRecognizer(longPressGesture)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = moviesList[indexPath.row]
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        resultViewController.movie = movie
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
}
