//
//  IntroViewController.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/3/25.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import Hero

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

class IntroViewController: UIViewController {
    
    var section: Section?
    var panGR: UIPanGestureRecognizer!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let section = section {
            let name = section.name
            nameLabel.text = name
            nameLabel.hero.id = "\(name)_name"
            nameLabel.hero.modifiers = [.zPosition(4)]
            imageView.image = section.image
            imageView.hero.id = "\(name)_image"
            imageView.hero.modifiers = [.zPosition(2)]
            descriptionLabel.hero.id = "\(name)_description"
            descriptionLabel.hero.modifiers = [.zPosition(4)]
            descriptionLabel.text = section.description
        }
        
        panGR = UIPanGestureRecognizer(target: self, action: #selector(handlePan(gestureRecognizer:)))
        view.addGestureRecognizer(panGR)
    }
    
    //MARK: gesture recognizer
    @objc func handlePan(gestureRecognizer:UIPanGestureRecognizer) {
        // calculate the progress based on how far the user moved
        let translation = panGR.translation(in: nil)
        let progress = translation.y / 2 / view.bounds.height
        
        switch panGR.state {
        case .began:
            // begin the transition as normal
            dismiss(animated: true, completion: nil)
        case .changed:
            Hero.shared.update(progress)
            
            // update views' position (limited to only vertical scroll)
            Hero.shared.apply(modifiers: [.position(translation + imageView.center)], to: imageView)
            Hero.shared.apply(modifiers: [.position(translation + nameLabel.center)], to: nameLabel)
            Hero.shared.apply(modifiers: [.position(translation + descriptionLabel.center)], to: descriptionLabel)
            let imagePosition = CGPoint(x: imageView.center.x, y: translation.y + imageView.center.y)
            let namePosition = CGPoint(x: nameLabel.center.x, y: translation.y + nameLabel.center.y)
            let descPosition = CGPoint(x: descriptionLabel.center.x, y: translation.y + descriptionLabel.center.y)
            Hero.shared.apply(modifiers: [.position(imagePosition)], to: imageView)
            Hero.shared.apply(modifiers: [.position(namePosition)], to: nameLabel)
            Hero.shared.apply(modifiers: [.position(descPosition)], to: descriptionLabel)
        default:
            // end or cancel the transition based on the progress and user's touch velocity
            if progress + panGR.velocity(in: nil).y / view.bounds.height > 0.3 {
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
    
}
