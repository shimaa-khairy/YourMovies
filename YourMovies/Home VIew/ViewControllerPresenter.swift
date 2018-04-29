//
//  ViewControllerPresenter.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
class ViewControllerPresenter: ViewControllerPresenterProtocol {
    var mView : ViewControllerView
    var mRepo : RepositoryProtocol

    init(view : ViewControllerView) {
        mView = view
        mRepo = RepositoryImpl()
    }
    
    func getMostPopulerMovies() {
        //TODO Call the repo to get movies
        mRepo.getAllMovies(requestType: 0, presenter: self)
    }
    
    func getTopRatedMovies() {
        //TODO Call the repo to get movies
        //mView.updateMoviesList(movies: mRepo.getFavoriteMovies())
        mRepo.getAllMovies(requestType: 1, presenter: self)
    }
    
    func getTheMoviesList(movies: [Movie]) {
        if(movies.count > 0){
            mView.updateMoviesList(movies: movies)
        }else{
            mView.noMoviesFound()
        }
    }
    
    func getAllFavoriteMovies() {
        mView.updateMoviesList(movies: mRepo.getFavoriteMovies()) 
    }
    
}
