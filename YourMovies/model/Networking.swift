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
////// json responce classes
class JsonResult:Decodable{
    let results:[Movie]
    init() {
        results = [Movie]()
    }
}
class MovieReviewResult:Decodable{
    let results:[Review]
    init() {
       results = [Review]()
    }
}
class MovieTrailerResult:Decodable{
    let results:[Trailer]
    init() {
        results = [Trailer]()
    }
}
/////////////////////////////
class Networking: NSObject {
    var movies = [Movie]()
    var jsonResult = JsonResult()
    var reviewResult = MovieReviewResult()
    var TrailerResult = MovieTrailerResult()
    var CoreDataOpject = CoreDataModel()
}

extension Networking : NetworkingProtocol{
  
    /////////-------- func implementation -----//////////
    func getMovies(requestType:Int){
        let url: URL
        switch requestType {
        case 0:
            // most popular movies
            url = URL(string: "http://api.themoviedb.org/3/discover/movie?api_key=30b6cd3d9e4cad94e10055d0eb5cdbcc&sort_by=popularity.desc")!
        case 1:
            // top rated movies
            url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=30b6cd3d9e4cad94e10055d0eb5cdbcc&language=en-US&page=1")!
        default:
           ///most popular
            url = URL(string: "http://api.themoviedb.org/3/discover/movie?api_key=30b6cd3d9e4cad94e10055d0eb5cdbcc&sort_by=popularity.desc")!
        }
       
        Alamofire.request(url).responseJSON{(response) in
            let resultData = response.data
            print(response.data)
            do{
                self.jsonResult = try JSONDecoder().decode(JsonResult.self, from: resultData!)
                self.movies = self.jsonResult.results
                self.CoreDataOpject.saveAllMovies(movies: self.movies)
            for movie in self.movies{
               // print (movie.id,":",movie.title,":",movie.vote_average)
                }
            }catch{
               
                print ("error")}
        }
        
      
    }
   ///////////////////////////////////////////
    
    func getMovieTrailers(movieId:Int) {
     var MovieTrailers = [Trailer]()
     let url = URL(string: "https://api.themoviedb.org/3/movie/"+String(movieId)+"/videos?api_key=30b6cd3d9e4cad94e10055d0eb5cdbcc&language=en-US")!
        Alamofire.request(url).responseJSON{(response) in
            let resultData = response.data
            do{
                self.TrailerResult = try JSONDecoder().decode(MovieTrailerResult.self, from:resultData!)
                MovieTrailers = self.TrailerResult.results
                for movie in MovieTrailers{
                    print (movie.name,":",movie.key)
                }
            }
            catch{
                print("error")
            }
            
        }
    }
    
   ///////////////////////////////////////////
    
    func getMovieReviews(movieId:Int) {
        var movieReviews = [Review]()
        let url = URL(string: "https://api.themoviedb.org/3/movie/"+String(movieId)+"/reviews?api_key=30b6cd3d9e4cad94e10055d0eb5cdbcc")!
        Alamofire.request(url).responseJSON{(response) in
            let resultData = response.data
            do{
                self.reviewResult = try JSONDecoder().decode(MovieReviewResult.self, from: resultData!)
                
                    movieReviews = self.reviewResult.results
                print(movieReviews[0].author,movieReviews[0].content)
                
            }catch{
                print ("error")
                
            }
            
        }
        
            
    
       
    }
    
    
    
    
}
