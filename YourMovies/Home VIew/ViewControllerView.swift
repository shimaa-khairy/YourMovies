//
//  ViewControllerView.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
protocol ViewControllerView {
    
    func updateMoviesList(movies : [Movie]) -> Void
    
    func noMoviesFound() -> Void
}
