//
//  DetailsViewControllerView.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
protocol DetailsViewControllerView {
 
    func addToFavorite() -> Void
    
    func removeFromFavorite() -> Void
    
    func fillTrailers(trailersList: [Trailer])
    
}
