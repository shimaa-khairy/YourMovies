//
//  ReviewsTableViewContollerProctol.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/29/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
class ReviewsTableViewContollerpresenter: ReviewsTableViewControllerPresenterProctol {
    var mRepo : RepositoryProtocol?
    var mView : ReviewsTableControllerViewProctol?
    init(view : ReviewsTableControllerViewProctol) {
        mView = view
        mRepo = RepositoryImpl()
    }
    
    func getAllReviews(movieId: Int) {
        mRepo?.getMovieReviews(movieId: movieId, presenter: self)
    }
    
    func loadAllReviews(mReviews : [Review]){
        mView?.fillAllReviews(reviews: mReviews)
    }
    
}
