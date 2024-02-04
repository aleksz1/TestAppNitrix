//
//  MoviesCellSetUp.swift
//  TestAppNitrix
//
//  Created by Иван on 03.02.2024.
//

import UIKit

final class MoviesCell: UICollectionViewCell {
 
    let label1: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(imageView)
    
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            label1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 5),
            label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
        contentView.heightAnchor.constraint(equalToConstant: contentView.frame.height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

