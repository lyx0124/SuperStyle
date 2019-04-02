//
//  FeatureViewController.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/3/26.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import Hero

class FeatureViewController: UIViewController {
    
    var feature: Feature?
    var featureNumber: Int?
    var originalImage: UIImage? //store original chosen image, maybe need to save to memory and use image url
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let feature = feature {
            let name = feature.name
            nameLabel.text = name
            nameLabel.hero.id = "\(name)_name"
            nameLabel.hero.modifiers = [.zPosition(4)]
            imageView.image = feature.image
            imageView.hero.id = "\(name)_image"
            imageView.hero.modifiers = [.zPosition(2)]
            descriptionLabel.hero.id = "\(name)_description"
            descriptionLabel.hero.modifiers = [.zPosition(4)]
            descriptionLabel.text = feature.description
        }
    }
    
    @IBAction func pickImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Action", message: "Choose a photo or save result", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action: UIAlertAction) in
            //save image to photo library
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}

extension FeatureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: image picker setup
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        if image.size.width > image.size.height {
            photo.contentMode = UIView.ContentMode.scaleAspectFill
        } else {
            photo.contentMode = UIView.ContentMode.scaleAspectFit
        }
        photo.image = image
        originalImage = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension FeatureViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: collection view setup
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count: Int!
        switch featureNumber {
        case 0:
            count = Style.styles.count
        case 1:
            count = Style.portraits.count
        case 2:
            count = Style.domains.count
        default:
            count = 0 //test
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? StyleCell)!
        switch featureNumber {
        case 0:
            cell.style = Style.styles[indexPath.item]
        case 1:
            cell.style = Style.portraits[indexPath.item]
        case 2:
            cell.style = Style.domains[indexPath.item]
        default:
            cell.style = nil //test
            print("style error")
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let image = originalImage {
            applyStyle(input: image, style: indexPath.item)
        }
        else {
            //need to disable and enable style cell interaction when necessary
            //and this is clearly not right
            collectionView.cellForItem(at: indexPath)?.isUserInteractionEnabled = false
        }
    }
    
}

extension FeatureViewController {
   
    func applyStyle(input: UIImage, style: Int) {
        if featureNumber == 0 { //from styles cell
            switch style {
            case 0:
                print("00")
            case 1:
                print("01")
            case 2:
                print("02")
            case 3:
                print("03")
            default:
                print("error") //test
            }
        }
        else if featureNumber == 1 { //from portraits cell
            switch style {
            case 0:
                print("10")
            case 1:
                print("11")
            case 2:
                print("12")
            case 3:
                print("13")
            default:
                print("error") //test
            }
        }
        else if featureNumber == 2 { //from domains cell
            switch style {
            case 0:
                print("20")
            case 1:
                print("21")
            case 2:
                print("22")
            case 3:
                print("23")
            default:
                print("error") //test
            }
        }
        else {
            print("error") //test
        }
    }
    
}

