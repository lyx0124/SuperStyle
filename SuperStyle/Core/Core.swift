//
//  Core.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/4/2.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import CoreML
import Vision

extension FeatureViewController {
    
    func applyStyle(input: UIImage, style: Int) {
        if featureNumber == 0 { //from styles cell
            switch style {
            case 0:
                applyMosaic(input: input)
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
    }
    
    func applyMosaic(input: UIImage) {
        let model = MosaicModel()
        DispatchQueue.global().async {
            self.showWaitingAlert()
            guard let inputImage = input.resize(to: CGSize(width: 1080, height: 1080)) else { return }
            guard let cvBufferInput = inputImage.pixelBuffer() else { return }
            guard let output = try? model.prediction(_0: cvBufferInput) else { return }
            guard let outputImage = UIImage(pixelBuffer: output._186) else { return }
            guard let finalImage = outputImage.resize(to: input.size) else { return }
            DispatchQueue.main.async {
                self.photo.image = finalImage
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

