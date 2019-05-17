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
        Style(name: "",
                image: UIImage(named: "mosaic")!,
                shortDescription: "",
                description: ""),
        Style(name: "",
                image: UIImage(named: "candy")!,
                shortDescription: "",
                description: ""),
        Style(name: "",
                image: UIImage(named: "rain-princess")!,
                shortDescription: "",
                description: ""),
        Style(name: "",
                image: UIImage(named: "udnie")!,
                shortDescription: "",
                description: "")
    ]
    
    static var portraits = [
        Style(name: "",
                image: UIImage(named: "stargan")!,
                shortDescription: "",
                description: ""),
        Style(name: "Black",
              image: UIImage(named: "blonde")!,
              shortDescription: "",
              description: ""),
        Style(name: "Blonde",
              image: UIImage(named: "blonde")!,
              shortDescription: "",
              description: ""),
        Style(name: "Brown",
                image: UIImage(named: "blonde")!,
                shortDescription: "",
                description: ""),
        Style(name: "Male",
                image: UIImage(named: "male")!,
                shortDescription: "",
                description: ""),
        Style(name: "Young",
                image: UIImage(named: "male")!,
                shortDescription: "",
                description: "")
    ]
    
    static var domains = [
        Style(name: "Blonde",
              image: UIImage(named: "blonde")!,
              shortDescription: "",
              description: ""),
        Style(name: "Male",
              image: UIImage(named: "blonde")!,
              shortDescription: "",
              description: ""),
        Style(name: "Female",
              image: UIImage(named: "male")!,
              shortDescription: "",
              description: ""),
        Style(name: "Age",
              image: UIImage(named: "male")!,
              shortDescription: "",
              description: "")
    ]
    
}

