//
//  RepositoryImpl.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/28/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
class RepositoryImpl : RepositoryProtocol{
    func getAllMovies(requestType: Int) {
        
    }
    
    func getMovieTrailers(movieId: Int) {
        
    }
    
    func getMovieReviews(movieId: Int) {
        
    }
    
    func addToFavorite(movie: Movie) -> Bool {
      return true
    }
    
    func getFavoriteMovies() -> [Movie] {
       return([Movie()])
    }
    
    func isFavorite(movieId: Int) -> Bool {
       return true
    }
    
    func removeFavorite(movieId: Int) -> Bool {
      return true
    }
    
    
}
