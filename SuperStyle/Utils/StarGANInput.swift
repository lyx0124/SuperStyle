//
//  StarGANInput.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/5/18.
//  Copyright © 2019 leo. All rights reserved.
//

import Foundation
import CoreML

class StarGANInput : MLFeatureProvider {
    
    // Input image in the format of CVPixelBuffer
    var _0: CVPixelBuffer
    var _1: MLMultiArray
    
    // Input feature name
    var featureNames: Set<String> {
        get {
            return ["0", "1"]
        }
    }
    
    // Value for a certain input feature.
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "0") {
            return MLFeatureValue(pixelBuffer: _0)
        }
        if (featureName == "1") {
            return MLFeatureValue(multiArray: _1)
        }
        return nil
    }
    
    init(_0: CVPixelBuffer, _1: MLMultiArray) {
        self._0 = _0
        self._1 = _1
    }
    
}

