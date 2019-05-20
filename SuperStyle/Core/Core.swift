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
            case 4:
                applyMuse(input: input)
            case 5:
                applyStarry(input: input)
            case 6:
                applySketch(input: input)
            case 7:
                applyWave(input: input)
            case 8:
                applyScream(input: input)
            default:
                showAlertWithMessage(message: "Error!")
            }
        }
        else if featureNumber == 1 { //from portraits cell
            if style == 0 {
                applyStarGAN(input: input)
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
    
    func applyMuse(input: UIImage) {
        let model = Muse()
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
    
    func applyStarry(input: UIImage) {
        let model = Starry()
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

    func applySketch(input: UIImage) {
        let model = Sketch()
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

    func applyWave(input: UIImage) {
        let model = Wave()
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

    func applyScream(input: UIImage) {
        let model = Scream()
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
//        let modelUrl = Bundle.main.url(forResource: "Generator", withExtension: "mlmodel")
//        guard let compiledUrl = try? MLModel.compileModel(at: modelUrl!) else { return }
//        guard let model = try? MLModel(contentsOf: compiledUrl) else { return }
//        DispatchQueue.global().async {
//            self.showWaitingAlert(message: "Applying style...")
//            guard let inputImage = input.resize(to: CGSize(width: 256, height: 256)) else { return }
//            guard let cvBufferInput = inputImage.pixelBuffer() else { return }
//            //guard let output = try? model.prediction(_0: cvBufferInput, _1: self.label) else { return }
//            guard let output = try? model.prediction(from: StarGANInput(_0: cvBufferInput, _1: self.label)) else {return}
//            let outputFeature = output.featureValue(for: "_186")
//            guard let outputImage = UIImage(pixelBuffer: outputFeature as! CVPixelBuffer) else { return }
//            guard let finalImage = outputImage.resize(to: input.size) else { return }
//            DispatchQueue.main.async {
//                self.photo.image = finalImage
//            }
//            self.dismiss(animated: true, completion: nil)
//        }
        let model = Generator()
        DispatchQueue.global().async {
            self.showWaitingAlert(message: "Applying style...")
            
            for i in 0...4 {
                for j in 0...255 {
                    for k in 0...255 {
                        self.label[[NSNumber(value: i), NSNumber(value: j), NSNumber(value: k)]] = NSNumber(value: self.selected[i+1])
                    }
                }
            }
            
            guard let inputImage = input.resize(to: CGSize(width: 256, height: 256)) else { return }
            guard let cvBufferInput = inputImage.pixelBuffer() else { return }
            guard let output = try? model.prediction(_0: cvBufferInput, _1: self.label) else { return }
            guard let outputImage = UIImage(pixelBuffer: output._186) else { return }
            guard let finalImage = outputImage.resize(to: input.size) else { return }
            DispatchQueue.main.async {
                self.photo.image = finalImage
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

