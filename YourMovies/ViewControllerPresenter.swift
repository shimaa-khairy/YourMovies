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
    
    init(view : ViewControllerView) {
        mView = view
    }
    
    func getMostPopulerMovies() {
        //TODO Call the repo to get movies
    }
    
    func getTopRatedMovies() {
        //TODO Call the repo to get movies
    }
    
    func getTheMoviesLiet(movies: [Movie]) {
        if(movies.count > 0){
            mView.updateMoviesList(movies: movies)
        }else{
            mView.noMoviesFound()
        }
    }
    
}
