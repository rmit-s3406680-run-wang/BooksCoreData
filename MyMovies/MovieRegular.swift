//
//  MovieRegular.swift
//  MyMovies
//
//  Created by Rodney Cocker on 21/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import Foundation
class MovieRegular: iMovie
{
    var title: String
    var subtitle : String
    var imageName: String
    
    init(title: String, subtitle:String, imageName:String)
    {
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
    }
    
    func getTitle()->String
    {
        return self.title as String
    }
    
    func getSubTitle()->String
    {
        return self.subtitle as String
    }
    
    func getImageName()->String
    {
        return self.imageName as String
    }
    
}