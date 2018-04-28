//
//  RepositoryImpl.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/28/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
class RepositoryImpl : RepositoryProtocol{
    var coreDataObject = CoreDataModel()
    var netWorkingObject = Networking()
    func getAllMovies(requestType: Int){
        var connection = true
        if(connection){
            netWorkingObject.getMovies(requestType: requestType)
        }else{
            var movies = coreDataObject.getAllMovies()
        }
    }
    
    func getMovieTrailers(movieId: Int) {
        netWorkingObject.getMovieTrailers(movieId: movieId)
    }
    
    func getMovieReviews(movieId: Int) {
        netWorkingObject.getMovieReviews(movieId: movieId)
    }
    
    func addToFavorite(movie: Movie) -> Bool {
      return coreDataObject.addToFavorite(movie:movie)
    }
    
    func getFavoriteMovies() -> [Movie] {
       return(coreDataObject.getFavoriteMovies())
    }
    
    func isFavorite(movieId: Int) -> Bool {
       return (coreDataObject.isFavorite(movieId:movieId))
    }
    
    func removeFavorite(movieId: Int) -> Bool {
      return (coreDataObject.removeFavorite(movieId:movieId))
    }
    
    
}
