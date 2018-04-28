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
    var id:Int
    var title:String
    var poster_path:String
    var overview:String
    var release_date:String
    var vote_average:Float
    var isFavorite:Bool?
    init() {
        id = 0
        title = ""
        poster_path = ""
        overview = ""
        release_date = ""
        vote_average = 0.0
        
    }
    
}
