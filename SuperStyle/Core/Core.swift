//
//  Core.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/4/2.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import CoreML

extension FeatureViewController {
    
    func applyStyle(input: UIImage, style: Int) {
        if featureNumber == 0 { //from styles cell
            switch style {
            case 0:
                applyMosaic(input: input)
            case 1:
                applyCandy(input: input)
            case 2:
                applyRainPrincess(input: input)
            case 3:
                applyUdnie(input: input)
            default:
                showAlertWithMessage(message: "Error!")
            }
        }
        else if featureNumber == 1 { //from portraits cell
            switch style {
            case 0:
                showAlertWithMessage(message: "To be developed.")
            case 1:
                showAlertWithMessage(message: "To be developed.")
            case 2:
                showAlertWithMessage(message: "To be developed.")
            case 3:
                showAlertWithMessage(message: "To be developed.")
            default:
                showAlertWithMessage(message: "Error!")
            }
        }
        else if featureNumber == 2 { //from domains cell
            switch style {
            case 0:
                showAlertWithMessage(message: "To be developed.")
            case 1:
                showAlertWithMessage(message: "To be developed.")
            case 2:
                showAlertWithMessage(message: "To be developed.")
            case 3:
                showAlertWithMessage(message: "To be developed.")
            default:
                showAlertWithMessage(message: "Error!")
            }
        }
    }
    
    func applyMosaic(input: UIImage) {
        let model = MosaicModel()
        DispatchQueue.global().async {
            self.showWaitingAlert()
            //this resize here controlls the memory, speed and precision of the transfer
            guard let inputImage = input.resize(to: CGSize(width: 512, height: 512)) else { return }
            guard let cvBufferInput = inputImage.pixelBuffer() else { return }
            guard let output = try? model.prediction(input_1: cvBufferInput) else { return }
            guard let outputImage = UIImage(pixelBuffer: output._128) else { return }
            guard let finalImage = outputImage.resize(to: input.size) else { return }
            DispatchQueue.main.async {
                self.photo.image = finalImage
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func applyCandy(input: UIImage) {
        let model = CandyModel()
        DispatchQueue.global().async {
            self.showWaitingAlert()
            guard let inputImage = input.resize(to: CGSize(width: 512, height: 512)) else { return }
            guard let cvBufferInput = inputImage.pixelBuffer() else { return }
            guard let output = try? model.prediction(input_1: cvBufferInput) else { return }
            guard let outputImage = UIImage(pixelBuffer: output._128) else { return }
            guard let finalImage = outputImage.resize(to: input.size) else { return }
            DispatchQueue.main.async {
                self.photo.image = finalImage
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func applyRainPrincess(input: UIImage) {
        let model = RainPrincessModel()
        DispatchQueue.global().async {
            self.showWaitingAlert()
            guard let inputImage = input.resize(to: CGSize(width: 512, height: 512)) else { return }
            guard let cvBufferInput = inputImage.pixelBuffer() else { return }
            guard let output = try? model.prediction(input_1: cvBufferInput) else { return }
            guard let outputImage = UIImage(pixelBuffer: output._128) else { return }
            guard let finalImage = outputImage.resize(to: input.size) else { return }
            DispatchQueue.main.async {
                self.photo.image = finalImage
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func applyUdnie(input: UIImage) {
        let model = UdnieModel()
        DispatchQueue.global().async {
            self.showWaitingAlert()
            guard let inputImage = input.resize(to: CGSize(width: 512, height: 512)) else { return }
            guard let cvBufferInput = inputImage.pixelBuffer() else { return }
            guard let output = try? model.prediction(input_1: cvBufferInput) else { return }
            guard let outputImage = UIImage(pixelBuffer: output._128) else { return }
            guard let finalImage = outputImage.resize(to: input.size) else { return }
            DispatchQueue.main.async {
                self.photo.image = finalImage
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

