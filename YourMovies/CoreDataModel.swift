//
//  CoreDataModel.swift
//  YourMovies
//
//  Created by Ahmed Mokhtar on 4/23/18.
//  Copyright © 2018 FallenLeafs. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class CoreDataModel : CoreDataProtocol{
    
    
    func saveAllMovies(movies: [Movie]) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MovieEntity", in: context)
        //clear old opject befor save
        clearAllData(entity: "MovieEntity")
        print(movies.count)
        for i in 0..<movies.count{
        var newMovie = NSManagedObject(entity: entity!,insertInto: context)
        newMovie.setValue(movies[i].id, forKey: "id")
        newMovie.setValue(movies[i].overview, forKey:"overview" )
        newMovie.setValue(movies[i].title, forKey: "title")
        newMovie.setValue(movies[i].poster_path, forKey:"poster_path" )
        newMovie.setValue(movies[i].release_date, forKey:"release_date" )
        newMovie.setValue(movies[i].vote_average, forKey:"vote_average" )
        
        do {
            try context.save()
          
        } catch {
            print("Failed saving")
        
            }}
       
    }
    func clearAllData(entity:String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do{
            try context.execute(request)
        }catch{
            print("failed")
        }
      

    
    }
    func getAllMovies() -> [Movie] {
        var movies = [Movie]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "MovieEntity")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            
            for data in result as! [NSManagedObject] {
                var movie = Movie()
                movie.id = data.value(forKey: "id") as! Int
                movie.title = data.value(forKey: "title") as! String
                movie.release_date = data.value(forKey: "release_date")as! String
                movie.overview = data.value(forKey: "overview")as! String
                movie.poster_path = data.value(forKey: "poster_path") as! String
                movie.vote_average = data.value(forKey: "vote_average") as! Float
                movies.append(movie)
                
            }
            
        } catch {
            
            print("Failed")
        }
        
        
        return movies
    }
    
    func addToFavorite(movie: Movie)->Bool{
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteEntity", in: context)
        var newMovie = NSManagedObject(entity: entity!,insertInto: context)
        newMovie.setValue(movie.id, forKey: "id")
        newMovie.setValue(movie.overview, forKey:"overview" )
        newMovie.setValue(movie.title, forKey: "title")
        newMovie.setValue(movie.poster_path, forKey:"poster_path" )
        newMovie.setValue(movie.release_date, forKey:"release_date" )
        newMovie.setValue(movie.vote_average, forKey:"vote_average" )
        do {
            try context.save()
            return true
            
        } catch {
            print("Failed saving")
            
        }
        return false
    }
    
    func getFavoriteMovies() -> [Movie] {
        var movies = [Movie]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteEntity")
        do {
            let result = try context.fetch(request)
            var movie = Movie()
            for data in result as! [NSManagedObject] {
                var movie = Movie()
                movie.id = data.value(forKey: "id") as! Int
                movie.title = data.value(forKey: "title") as! String
                movie.release_date = data.value(forKey: "release_date")as! String
                movie.overview = data.value(forKey: "overview")as! String
                movie.poster_path = data.value(forKey: "poster_path") as! String
                movie.vote_average = data.value(forKey: "vote_average") as! Float
                movies.append(movie)
            }
            
        } catch {
            
            print("Failed")
        }
        return movies
    }
    
    func isFavorite(movieId: Int) -> Bool{
       var movies = getFavoriteMovies()
        for i in 0..<movies.count{
            if(movies[i].id==19404)
            //if (movieId==movies[i].id)
            {
                return true
            }
        }
        return false
        
    }
    
    func removeFavorite(movieId: Int)->Bool
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteEntity")
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                if( data.value(forKey: "id")as! Int == movieId){
                context.delete(data)
                return true
                }
            }
        } catch {
            print("Failed")
        }
        return false
    }
    
    
}
