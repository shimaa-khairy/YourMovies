//
//  Networking.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/16/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import UIKit
import Alamofire
class Movie:Decodable
{
    let name:String
    let capital:String
    
}

class Networking: NSObject {
    var movies = [Movie]()
    func startAlamo(){
    let url = URL(string: "https://restcountries.eu/rest/v2/all")
    
    Alamofire.request(url!).responseJSON{(response) in
        let resultData = response.data
       // print (resultData)
        do{
        self.movies = try JSONDecoder().decode([Movie].self, from: resultData!)
            
            for movie in self.movies{
                print (movie.name,":",movie.capital)
            }
      }catch{
        print ("error")}
        }
        
     
        
    }
}
