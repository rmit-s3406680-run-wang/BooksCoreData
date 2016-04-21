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
class Model
{
    
//    var movies  : [Movie] = [Movie]()
    var moviedb = [NSManagedObject]()
    
    func getMovie(indexPath: NSIndexPath) -> Movie
    {
        return moviedb[indexPath.row] as! Movie
    }
    
    func deleteMovie(movie: Movie)
    {
        
        // Get a reference to your App Delegate
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Get a reference to a ManagedObjectContext for interacting with
        // the underlying database
        let managedContext = appDelegate.managedObjectContext
        managedContext.deleteObject(movie)
        
        do {
            try managedContext.save()
            //5
//            movies.append(movie)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func getMovies()
    {
        // Get a reference to your App Delegate
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Get a reference to a ManagedObjectContext for interacting with
        // the underlying database
        let managedContext = appDelegate.managedObjectContext
        
                do {
                    let fetchRequest = NSFetchRequest(entityName:"Movie")

            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            moviedb = results as! [Movie]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        print("")
    }
    
    func saveMovie(title: String, subtitle:String, existing: Movie?)
    {
        
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Movie",
            inManagedObjectContext:managedContext)
        
//        let movie = NSManagedObject(entity: entity!,
//            insertIntoManagedObjectContext: managedContext)
        
        if((existing) == nil)
        {
            // Create an object based on the Entity
            let movie = Movie(entity: entity!,
                insertIntoManagedObjectContext:managedContext)
            movie.name = title
            movie.subtitle = subtitle
            movie.imageName = ""
//            self.movies.append(movie)
        }
        else
        {
            existing!.name = title
            existing!.subtitle = subtitle
           
        }

        
                do {
            try managedContext.save()
            //5
//            movies.append(movie as! Movie)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
print("")
    }
    
    /* This is a class variable allowing me to access it
    without first instantiating the model
    
    Now we can retrieve the model without instantiating it directly
    
    var model = Model.sharedInstance
    */
    
    // Here we use a Struct to hold the instance of the model i.e itself
    private struct Static
    {
        static var instance: Model?
    }
    
    
    class var sharedInstance: Model
    {
        if (Static.instance == nil)
        {
            Static.instance = Model()
        }
        return Static.instance!
    }
    
}