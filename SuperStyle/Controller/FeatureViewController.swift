//
//  FeatureViewController.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/3/26.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import Hero
import CoreML

class FeatureViewController: UIViewController, UIScrollViewDelegate {
    
    var feature: Feature?
    var featureNumber: Int?
    var url: URL?
    var styleApplied = false //record whether style transfer is used
    var label = try! MLMultiArray(shape: [5], dataType: MLMultiArrayDataType.float32) // stargan label
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        
        //initialize label for stargan
        for i in 1...5 {
            label[i] = 0
        }
        
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
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? { //pinch to zoom
        return photo
    }
    
    @IBAction func pickImage(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Action", message: "Choose a photo or save result", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func saveResult(_ sender: Any) {
        if let image = photo.image {
            if styleApplied {
                let imageData = image.pngData()
                let compresedImage = UIImage(data: imageData!)
                UIImageWriteToSavedPhotosAlbum(compresedImage!, nil, nil, nil)
                
                let alert = UIAlertController(title: "Saved", message: "Your photo has been saved.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            else {
                showAlertWithMessage(message: "Please choose a style first.")
            }
        }
        else {
            showAlertWithMessage(message: "No photo to save.")
        }
    }
    
    @IBAction func shareImage(_ sender: Any) {
        if let image = photo.image {
            let imageData = image.pngData()
            let compresedImage = UIImage(data: imageData!)
            let controller = UIActivityViewController(activityItems: [compresedImage!], applicationActivities: nil)
            present(controller, animated: true, completion: nil)
        }
        else {
            showAlertWithMessage(message: "No photo to share.")
        }
    }
    
}

extension FeatureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: image picker setup
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        photo.image = image
        url = saveImage(image: image)
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
            count = 0
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
            cell.style = nil
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if photo.image != nil{
            if let image = getImageFromURL(url: url) {
                applyStyle(input: image, style: indexPath.item)
                styleApplied = true
            }
        }
        else{
            showAlertWithMessage(message: "Please take or choose a photo first.")
        }
    }
    
}

