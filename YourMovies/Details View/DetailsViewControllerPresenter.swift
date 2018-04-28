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
    
    init(view : DetailsViewControllerView) {
        mView = view
    }
    
    
    func addToFavorite(movie: Movie) {
        
    }
    
    func removeFromFavorite(movie: Movie) {
        
    }
    
}
