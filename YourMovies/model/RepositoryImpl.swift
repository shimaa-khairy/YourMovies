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
    let delegate = UIApplication.shared.delegate as! AppDelegate

    var coreDataObject : CoreDataProtocol?
    var netWorkingObject : NetworkingProtocol?
    
    init() {
        coreDataObject = CoreDataModel()
        netWorkingObject = Networking()
    }
    func getAllMovies(requestType: Int, presenter: ViewControllerPresenterProtocol) {
        //Check internet connection
        if(delegate.isInternetAvailable)!{
            self.netWorkingObject?.getMovies(requestType: requestType, protocolListener: presenter)
        }else{
            var movies = self.coreDataObject?.getAllMovies()
            presenter.getTheMoviesList(movies: movies!)
        }
    }
    
    func getMovieTrailers(movieId: Int, presenter: DetailsViewControllerPresenterProtocol) {
        netWorkingObject?.getMovieTrailers(movieId: movieId, protocolListener: presenter)

    }
    
    func getMovieReviews(movieId:Int, presenter: ReviewsTableViewControllerPresenterProctol){
        netWorkingObject?.getMovieReviews(movieId: movieId, protocolListener: presenter)
    }
    
  
    func addToFavorite(movie: Movie) -> Bool {
        return coreDataObject!.addToFavorite(movie:movie)
    }
    
    func getFavoriteMovies() -> [Movie] {
        return(coreDataObject!.getFavoriteMovies())
    }
    
    func isFavorite(movieId: Int) -> Bool {
        return (coreDataObject!.isFavorite(movieId:movieId))
    }
    
    func removeFavorite(movieId: Int) -> Bool {
        return (coreDataObject!.removeFavorite(movieId:movieId))
    }
    
    
}
