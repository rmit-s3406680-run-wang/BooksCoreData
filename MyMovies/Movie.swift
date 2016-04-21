//
//  Movie.swift
//  MyMovies
//
//  Created by Rodney Cocker on 21/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import Foundation
import CoreData

class Movie: NSManagedObject
{
    @NSManaged var name: String
    @NSManaged var subtitle: String
    @NSManaged var imageName: String
}
