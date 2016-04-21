//
//  TableViewController.swift
//  MyMovies
//
//  Created by Rodney Cocker on 21/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var model:Model = Model.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model.moviedb.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        let movie = model.getMovie(indexPath)
        cell.textLabel!.text = movie.name
        cell.detailTextLabel!.text = movie.subtitle
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!)
    {
        // identifier if required, if you have more then one segue
        if segue.identifier == "update"
        {
            // detailsVC should never be assigned to nil !!!
            var detailsVC: ViewController!
            
            // with help of adaptive segue we can support all devices
            if let movieListNavigationController = segue.destinationViewController as? UINavigationController
            {
                // works on devices where UISplitViewController is implemented
                detailsVC = movieListNavigationController.topViewController as! ViewController
                
                let indexPath = self.tableView.indexPathForSelectedRow!
                let movie = self.model.moviedb[indexPath.row]
            }
            else
            {
                // works for iPhone on ios7, where UISplitViewController is not implemented
                detailsVC = segue.destinationViewController as! ViewController
            }
            
            // Send data to the detail view ahead of segue
            if let selectedRowIndexPath = tableView.indexPathForSelectedRow
            {
                let movie = self.model.moviedb[selectedRowIndexPath.row]
                detailsVC.currentMovie = movie as! Movie
//                detailsVC.titleOfMovie = movie.valueForKey("name") as! String?
//                detailsVC.movieSubTitle = movie.valueForKey("subtitle") as! String?
//                detailsVC.existingItem = movie
                //                detailsVC.tableView = self.tableView
            }
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
        return true
    }
    
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        // Get a reference to a ManagedObjectContext for interacting with
        // the underlying database
        let managedContext = appDelegate.managedObjectContext
        
        if editingStyle == UITableViewCellEditingStyle.Delete
    {
        model.deleteMovie(model.moviedb[indexPath.row] as! Movie)
        model.moviedb.removeAtIndex(indexPath.row)
    
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        
        do {
        try managedContext.save()
        //5
//        movies.append(movie)
    } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    

    override func  viewDidAppear(animated: Bool) {
        
        self.tableView.reloadData()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         model.getMovies()
    }
   
}
