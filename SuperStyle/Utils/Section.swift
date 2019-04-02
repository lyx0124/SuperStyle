//
//  Section.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/3/25.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit

struct Section {
    var name: String
    var image: UIImage
    var shortDescription: String
    var description: String
    
    static var sections = [
        Section(name: "Intro",
             image: UIImage(named: "intro")!,
             shortDescription: "A Introduction to SuperStyle",
             description: "SuperStyle is a Deep Learning based style transfer app. It has three features: transferring a photo's style to paintings, changing portrait style, and switching image domain. Users can take a photo or choose one from gallery and use SuperStyle to edit it with just one push on the buttons."),
        Section(name: "Play",
             image: UIImage(named: "play")!,
             shortDescription: "Play around SuperStyle",
             description: "SuperStyle's features will enable you to edit your photos in jush one push on the buttons. Have fun with these features!"),
        Section(name: "Bugs",
             image: UIImage(named: "bugs")!,
             shortDescription: "Existing Bugs",
             description: "Device orientation, animation, Python models to CoreML models"),
        Section(name: "Credit",
                image: UIImage(named: "credit")!,
                shortDescription: "Credits for SuperStyle",
                description: "The creator of SuperStyle is Leo. I referred to diffenrent sources like Hero library, many StackOverflow posts and many well-known publications. Thanks to all these people. You guys made it possible for me to finish this project.")
    ]
}

