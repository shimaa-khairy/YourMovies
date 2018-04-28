//
//  CoreDataProtocol.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/23/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
protocol  CoreDataProtocol{
    func saveAllMovies(movies:[Movie])
    func clearAllData(entity:String)
    func getAllMovies()->[Movie]
    func addToFavorite(movie:Movie)->Bool
    func getFavoriteMovies()->[Movie]
    func isFavorite(movieId:Int)-> Bool
    func removeFavorite(movieId:Int)->Bool
}
