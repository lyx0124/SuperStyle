//
//  Utils.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/4/3.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit

func saveImage(image: UIImage) -> URL? {
    let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("originalImage.jpg")
    
    if let data = image.jpegData(compressionQuality: 1.0) {
        do {
            try data.write(to: url)
        }
        catch {
            print(error)
        }
    }
    
    return url
}

func getImageFromURL(url: URL?) -> UIImage? {
    if let url = url {
        let imageData = try? Data(contentsOf: url)
        if let data = imageData {
            return UIImage(data: data)
        }
    }
    
    return nil
}

extension UIViewController {
    
    func showWaitingAlert() {
        let alert = UIAlertController(title: nil, message: "Applying Style", preferredStyle: .alert)
    
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
    
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
}

