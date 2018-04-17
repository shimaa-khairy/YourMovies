//
//  Networking.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/16/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit
import Alamofire
////////////////////////////

class JsonResult:Decodable{
    
    let results:[Movie]
    init() {
        results = [Movie]()
    }
    
}
/////////////////////////////
class Networking: NSObject {
    var movies = [Movie]()
    var jsonResult = JsonResult()
}

extension Networking : NetworkingProtocol{
    
    func getMovies(requestType:Int)->[Movie] {
        let url: URL
        switch requestType {
        case 0:
            url = URL(string: "http://api.themoviedb.org/3/discover/movie?api_key=30b6cd3d9e4cad94e10055d0eb5cdbcc&sort_by=popularity.desc")!
        case 1:
            url = URL(string: "http://api.themoviedb.org/3/discover/movie?api_key=30b6cd3d9e4cad94e10055d0eb5cdbcc&sort_by=vote_average.desc")!
        default:
            url = URL(string: "http://api.themoviedb.org/3/discover/movie?api_key=30b6cd3d9e4cad94e10055d0eb5cdbcc&sort_by=popularity.desc")!
        }
       
       
        Alamofire.request(url).responseJSON{(response) in
            let resultData = response.data
            print(response.result)
            do{
                self.jsonResult = try JSONDecoder().decode(JsonResult.self, from: resultData!)
                self.movies = self.jsonResult.results
                print(self.jsonResult.results.count)
            for movie in self.movies{
                print (movie.id,":",movie.title,":",movie.vote_average)
                }
            }catch{
                print ("error")}
        }
        
       return self.movies
      
    }
    
    
    
}
