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
                image: UIImage(named: "mosaic")!,
                shortDescription: "Mosaic style",
                description: "Mosaic style"),
        Style(name: "Candy",
                image: UIImage(named: "candy")!,
                shortDescription: "Candy style",
                description: "Candy style"),
        Style(name: "Rain Princess",
                image: UIImage(named: "rain-princess")!,
                shortDescription: "Rain Princess style",
                description: "Rain Princess style"),
        Style(name: "Udnie",
                image: UIImage(named: "udnie")!,
                shortDescription: "Udnie style",
                description: "Udnie style")
    ]
    
    static var portraits = [
        Style(name: "",
                image: UIImage(named: "stargan")!,
                shortDescription: "",
                description: ""),
        Style(name: "Black",
              image: UIImage(named: "blonde")!,
              shortDescription: "Black hair",
              description: "Black hair"),
        Style(name: "Blonde",
              image: UIImage(named: "blonde")!,
              shortDescription: "Blonde hair",
              description: "Blonde hair"),
        Style(name: "Brown",
                image: UIImage(named: "blonde")!,
                shortDescription: "Brown hair",
                description: "Brown hair"),
        Style(name: "Male",
                image: UIImage(named: "male")!,
                shortDescription: "Male or not",
                description: "Male or not"),
        Style(name: "Young",
                image: UIImage(named: "male")!,
                shortDescription: "Young or not",
                description: "Young or not")
    ]
    
    static var domains = [
        Style(name: "Blonde",
              image: UIImage(named: "blonde")!,
              shortDescription: "Blonde style",
              description: "Blonde style"),
        Style(name: "Male",
              image: UIImage(named: "male")!,
              shortDescription: "Male style",
              description: "Male style"),
        Style(name: "Female",
              image: UIImage(named: "female")!,
              shortDescription: "Female style",
              description: "Female style"),
        Style(name: "Age",
              image: UIImage(named: "age")!,
              shortDescription: "Age style",
              description: "Age style")
    ]
    
}

