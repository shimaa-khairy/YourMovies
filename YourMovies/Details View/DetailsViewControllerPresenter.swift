//
//  DetailsViewControllerPresenter.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
class DetailsViewControllerPresenter: DetailsViewControllerPresenterProtocol {
    var mView : DetailsViewControllerView
    var mRepo : RepositoryProtocol
   
    init(view : DetailsViewControllerView) {
        mView = view
        mRepo = RepositoryImpl()
    }
    
    
    func addToFavorite(movie: Movie) {
        mRepo.addToFavorite(movie: movie)
    }
    
    func removeFromFavorite(movie: Int) {
        mRepo.removeFavorite(movieId: movie)
    }
    
    
    func getTrailers(movieId: Int) {
        mRepo.getMovieTrailers(movieId: movieId, presenter: self)
    }
    
    func loadTrailers(trailers: [Trailer]) {
        mView.fillTrailers(trailersList: trailers)
    }
    
    func isFavorite(movieId: Int) -> Bool {
        return mRepo.isFavorite(movieId: movieId)
    }
}
