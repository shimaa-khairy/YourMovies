//
//  ReviewsTableViewControllerPresenterProctol.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/29/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation

protocol ReviewsTableViewControllerPresenterProctol {
    func getAllReviews(movieId: Int)
    func loadAllReviews(mReviews : [Review])
}
