//
//  ListOfMovieTableViewCell.swift
//  MovieVIPERSwift
//
//  Created by Kevin Morales on 2/5/23.
//

import UIKit
import Kingfisher

final class ListOfMovieTableViewCell: UITableViewCell {
    var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 32,
                                 weight: .bold,
                                 width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,
                                 weight: .regular,
                                 width: .standard)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        addSubview(movieImageView)
        addSubview(movieName)
        addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            movieImageView.heightAnchor.constraint(equalToConstant: 200),
            movieImageView.widthAnchor.constraint(equalToConstant: 100),
            movieImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            
            movieName.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 18),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieName.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 24),
            
            movieDescription.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8),
            
            movieDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12)
        ])
    }
    
    func setUpCell(movie: ListOfMovieTableCellViewModel) {
        movieImageView.kf.setImage(with: movie.imageURL)
        movieName.text = movie.title
        movieDescription.text = movie.overview
    }
}
