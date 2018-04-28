//
//  NetworkingProtcol.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
protocol NetworkingProtocol{
    
    func getMovies(requestType:Int) 
    func getMovieTrailers(movieId:Int)
    func getMovieReviews(movieId:Int)
}