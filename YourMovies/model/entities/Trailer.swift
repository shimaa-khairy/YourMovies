//
//  Trailer.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/23/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
class Trailer:Decodable{
    let name:String
    let key:String
    init() {
        name = ""
        key = ""
    }
}
