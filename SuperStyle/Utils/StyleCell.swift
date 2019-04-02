//
//  StyleCell.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/4/1.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import Hero

class StyleCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var style: Style? {
        didSet {
            guard let style = style else { return }
            let name = style.name
            
            hero.id = "\(name)"
            nameLabel.text = name
            nameLabel.hero.id = "\(name)_name"
            nameLabel.hero.modifiers = [.zPosition(4)]
            imageView.image = style.image
            imageView.hero.id = "\(name)_image"
            imageView.hero.modifiers = [.zPosition(2)]
            descriptionLabel.hero.id = "\(name)_description"
            descriptionLabel.hero.modifiers = [.zPosition(4)]
            descriptionLabel.text = style.shortDescription
        }
    }
}
