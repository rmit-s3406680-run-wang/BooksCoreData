//
//  ViewController.swift
//  MyMovies
//
//  Created by Rodney Cocker on 21/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model:Model = Model.sharedInstance
    var currentMovie:Movie?
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet var name: UITextView!
    
    
    @IBOutlet var desc: UITextView!
    
    @IBOutlet var thumbnail1: UIImageView!
    @IBOutlet var thumbnail2: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = currentMovie
        {
                  name.text = currentMovie!.name
                    desc.text = currentMovie!.subtitle
                    banner?.image = UIImage(named: currentMovie!.imageName)
        }
        // Do any additional setup after loading the view, typically from a nib.
//         currentMovie = model.currentMovie
//      name.text = model.currentMovie.getTitle()
//        desc.text = model.currentMovie.getSubTitle()
//        banner?.image = UIImage(named: currentMovie!.imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func save(sender: AnyObject)
    {
        Model.sharedInstance.saveMovie(	name.text, subtitle: desc.text, existing: currentMovie)
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}

