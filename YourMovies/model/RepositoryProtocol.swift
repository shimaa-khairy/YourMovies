//
//  RepositoryProtocol.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/28/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
protocol RepositoryProtocol{
    func getAllMovies(requestType:Int, presenter: ViewControllerPresenterProtocol)
    func getMovieTrailers(movieId:Int, presenter: DetailsViewControllerPresenterProtocol)
    func getMovieReviews(movieId:Int, presenter: ReviewsTableViewControllerPresenterProctol)
    
    func addToFavorite(movie:Movie)->Bool
    func getFavoriteMovies()->[Movie]
    func isFavorite(movieId:Int)-> Bool
    func removeFavorite(movieId:Int)->Bool
}
