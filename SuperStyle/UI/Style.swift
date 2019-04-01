//
//  Style.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/4/1.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit

struct Style {
    var name: String
    var image: UIImage
    var shortDescription: String
    var description: String
    
    static var styles = [
        Style(name: "Mosaic",
                image: UIImage(named: "intro")!,
                shortDescription: "Mosaic style",
                description: "Mosaic style"),
        Style(name: "Candy",
                image: UIImage(named: "intro")!,
                shortDescription: "Candy style",
                description: "Candy style"),
        Style(name: "Rain Princess",
                image: UIImage(named: "intro")!,
                shortDescription: "Rain Princess style",
                description: "Rain Princess style"),
        Style(name: "Udnie",
                image: UIImage(named: "intro")!,
                shortDescription: "Udnie style",
                description: "Udnie style")
    ]
    
    static var portraits = [
        Style(name: "Blonde",
                image: UIImage(named: "play")!,
                shortDescription: "Blonde style",
                description: "Blonde style"),
        Style(name: "Male",
                image: UIImage(named: "play")!,
                shortDescription: "Male style",
                description: "Male style"),
        Style(name: "Female",
                image: UIImage(named: "play")!,
                shortDescription: "Female style",
                description: "Female style"),
        Style(name: "Age",
                image: UIImage(named: "play")!,
                shortDescription: "Age style",
                description: "Age style")
    ]
    
    static var domains = [
        Style(name: "Blonde",
              image: UIImage(named: "play")!,
              shortDescription: "Blonde style",
              description: "Blonde style"),
        Style(name: "Male",
              image: UIImage(named: "play")!,
              shortDescription: "Male style",
              description: "Male style"),
        Style(name: "Female",
              image: UIImage(named: "play")!,
              shortDescription: "Female style",
              description: "Female style"),
        Style(name: "Age",
              image: UIImage(named: "play")!,
              shortDescription: "Age style",
              description: "Age style")
    ]
    
}

