//
//  SectionCell.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/3/25.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import Hero

class SectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var section: Section? {
        didSet {
            guard let section = section else { return }
            let name = section.name
            
            hero.id = "\(name)"
            nameLabel.text = name
            nameLabel.hero.id = "\(name)_name"
            nameLabel.hero.modifiers = [.zPosition(4)]
            imageView.image = section.image
            imageView.hero.id = "\(name)_image"
            imageView.hero.modifiers = [.zPosition(2)]
            descriptionLabel.hero.id = "\(name)_description"
            descriptionLabel.hero.modifiers = [.zPosition(4)]
            descriptionLabel.text = section.shortDescription
        }
    }
}
