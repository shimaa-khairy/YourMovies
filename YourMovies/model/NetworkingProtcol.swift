//
//  NetworkingProtcol.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
protocol NetworkingProtocol{
    
    func getMovies(requestType:Int, protocolListener: ViewControllerPresenterProtocol)
    func getMovieTrailers(movieId:Int, protocolListener: DetailsViewControllerPresenterProtocol)
    func getMovieReviews(movieId:Int, protocolListener: ReviewsTableViewControllerPresenterProctol)
}
