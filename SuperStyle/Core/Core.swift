//
//  Core.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/4/2.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import CoreML

class StarGANInput : MLFeatureProvider {
    
    // Input image in the format of CVPixelBuffer
    var _0: CVPixelBuffer
    var _1: MLMultiArray
    
    // Input feature name
    var featureNames: Set<String> {
        get {
            return ["_0", "_1"]
        }
    }
    
    // Value for a certain input feature.
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "_0") {
            return MLFeatureValue(pixelBuffer: _0)
        }
        if (featureName == "_1") {
            return MLFeatureValue(multiArray: _1)
        }
        return nil
    }
    
    init(_0: CVPixelBuffer, _1: MLMultiArray) {
        self._0 = _0
        self._1 = _1
    }
    
}

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
                //applyStarGAN(input: input)
                showAlertWithMessage(message: "To be developed.")
            case 1:
                showAlertWithMessage(message: "To be developed.")
            case 2:
                showAlertWithMessage(message: "To be developed.")
            case 3:
                showAlertWithMessage(message: "To be developed.")
            case 4:
                showAlertWithMessage(message: "To be developed.")
            case 5:
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
            self.showWaitingAlert(message: "Applying style...")
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
            self.showWaitingAlert(message: "Applying style...")
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
            self.showWaitingAlert(message: "Applying style...")
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
            self.showWaitingAlert(message: "Applying style...")
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
    
    func applyStarGAN(input: UIImage) {
        let modelUrl = Bundle.main.url(forResource: "Generator", withExtension: "mlmodel")
        guard let compiledUrl = try? MLModel.compileModel(at: modelUrl!) else { return }
        guard let model = try? MLModel(contentsOf: compiledUrl) else { return }
        DispatchQueue.global().async {
            self.showWaitingAlert(message: "Applying style...")
            guard let inputImage = input.resize(to: CGSize(width: 256, height: 256)) else { return }
            guard let cvBufferInput = inputImage.pixelBuffer() else { return }
            //guard let output = try? model.prediction(_0: cvBufferInput, _1: self.label) else { return }
            guard let output = try? model.prediction(from: StarGANInput(_0: cvBufferInput, _1: self.label)) else {return}
            let outputFeature = output.featureValue(for: "_186")
            guard let outputImage = UIImage(pixelBuffer: outputFeature as! CVPixelBuffer) else { return }
            guard let finalImage = outputImage.resize(to: input.size) else { return }
            DispatchQueue.main.async {
                self.photo.image = finalImage
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

