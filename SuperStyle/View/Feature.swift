//
//  Feature.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/3/26.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit

struct Feature {
    var name: String
    var image: UIImage
    var shortDescription: String
    var description: String
    
    static var features = [
        Feature(name: "Style",
             image: UIImage(named: "intro")!,
             shortDescription: "Change image style",
             description: "Change image style"),
        Feature(name: "Portrait",
             image: UIImage(named: "bugs")!,
             shortDescription: "Change potrait style",
             description: "Change potrait style"),
        Feature(name: "Domain",
             image: UIImage(named: "play")!,
             shortDescription: "Change image domain",
             description: "Change image domain")
    ]
}
