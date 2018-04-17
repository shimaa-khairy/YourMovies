//
//  Movie.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/17/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit

class Movie: Decodable
{
    let id:Int
    let title:String
    let poster_path:String
    let overview:String
    let release_date:String
    let vote_average:Float
    init() {
        id = 0
        title = ""
        poster_path = ""
        overview = ""
        release_date = ""
        vote_average = 0.0
        
    }
    
}
