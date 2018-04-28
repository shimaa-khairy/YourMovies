//
//  Review.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/23/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
class Review:Decodable{
    let author:String
    let content:String
    init() {
        author = ""
        content = ""
    }
}
