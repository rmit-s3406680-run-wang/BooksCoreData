//
//  Model.swift
//  MyMovies
//
//  Created by Rodney Cocker on 21/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class ModelTemp
{
    
//    // Uses Core Data to manage data persistence
//    var movies  : [Movie] = [Movie]()
//    
//    
//    func getMovie(indexPath: NSIndexPath) -> Movie
//    {
//        return movies[indexPath.row]
//    }
//    
//    func deleteMovie(movie: Movie)
//    {
//        // Get a reference to your App Delegate
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        // Get a reference to a ManagedObjectContext for interacting with
//        // the underlying database
//        let managedContext = appDelegate.managedObjectContext!
//        managedContext.deleteObject(movie)
//        
//        var error: NSError?
//        if !managedContext.save(&error)
//        {
//            abort()
//        }
//    }
//    
//    func getMovies()
//    {
//        // Get a reference to your App Delegate
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        // Get a reference to a ManagedObjectContext for interacting with
//        // the underlying database
//        let managedContext = appDelegate.managedObjectContext!
//        
//        
//        // Retrieve all the records in the table
//        let fetchRequest = NSFetchRequest(entityName:"Movie")
//        var error: NSError?
//        let fetchedResults =
//        managedContext.executeFetchRequest(fetchRequest,
//            error: &error) as [Movie]?
//        
//        // Assign the results to the Model
//        if let results = fetchedResults
//        {
//            movies = results
//        }
//        else
//        {
//            print("Could not fetch \(error), \(error!.userInfo)")
//        }
//    }
//    
//    func saveMovie(title: String, subtitle:String, existing: Movie?)
//    {
//        // Get a reference to your App Delegate
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        // Get a reference to a ManagedObjectContext for interacting with
//        // the underlying database
//        let managedContext = appDelegate.managedObjectContext!
//        
//        // Get a entity from the database that represents the table your are
//        // wishing to work with
//        let entity =  NSEntityDescription.entityForName("Movie",
//            inManagedObjectContext:
//            managedContext)
//        
//        if((existing) == nil)
//        {
//            // Create an object based on the Entity
//            let movie = Movie(entity: entity!,
//                insertIntoManagedObjectContext:managedContext)
//            movie.title = title
//            movie.subtitle = subtitle
//            self.movies.append(movie)
//        }
//        else
//        {
//            existing!.title = title
//            existing!.subtitle = subtitle
//        }
//        
//        // Check for errors and save
//        var error: NSError?
//        if !managedContext.save(&error) {
//            print("Could not save \(error), \(error?.userInfo)")
//        }
//    }
//    
//    /* This is a class variable allowing me to access it
//    without first instantiating the model
//    
//    Now we can retrieve the model without instantiating it directly
//    
//    var model = Model.sharedInstance
//    */
//    
//    // Here we use a Struct to hold the instance of the model i.e itself
//    private struct Static
//    {
//        static var instance: Model?
//    }
//    
//    
//    class var sharedInstance: Model
//    {
//        if (Static.instance == nil)
//        {
//            Static.instance = Model()
//        }
//        return Static.instance!
//    }
    
}