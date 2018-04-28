//
//  RepositoryImpl.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/28/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
import Reachability
class RepositoryImpl : RepositoryProtocol{
    let reach = Reachability()!

    var coreDataObject = CoreDataModel()
    var netWorkingObject = Networking()
    func getAllMovies(requestType: Int){
        //Check internet connection
        reach.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                self.netWorkingObject.getMovies(requestType: requestType)

                } else {
                print("Reachable via Cellular")
                self.netWorkingObject.getMovies(requestType: requestType)
               }
        }
        
        reach.whenUnreachable = { _ in
            var movies = self.coreDataObject.getAllMovies()
            print("Not reachable")
        }
        
        do {
            try reach.startNotifier()
        } catch {
            print("Unable to start notifier")
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
