//
//  DetailsViewControllerPresenterProtocol.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
protocol DetailsViewControllerPresenterProtocol {
    func addToFavorite(movie: Movie) -> Void
    
    func removeFromFavorite(movie: Int) -> Void
    
    func getTrailers(movieId: Int)
    
    func loadTrailers(trailers: [Trailer])
    
    func isFavorite(movieId: Int) -> Bool
}
