//
//  Tile.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/5/18.
//  Copyright © 2019 leo. All rights reserved.
//

import Foundation
import CoreML

@objc(Tile) class Tile: NSObject, MLCustomLayer {
    required init(parameters: [String : Any]) throws {
        print("==========================================")
        print("1: ")
        print(#function, parameters)
        print("==========================================")
        super.init()
    }
    
    func setWeightData(_ weights: [Data]) throws {
        print("==========================================")
        print("2: ")
        print(#function, weights)
        print("==========================================")
    }
    
    func outputShapes(forInputShapes inputShapes: [[NSNumber]]) throws -> [[NSNumber]] {
        print("==========================================")
        print("3: ")
        print(#function, inputShapes)
        print("==========================================")
        return [[1, 1, 5, 256, 256]]
    }
    
    func evaluate(inputs: [MLMultiArray], outputs: [MLMultiArray]) throws {
        print("==========================================")
        print("4: ")
        print(#function, inputs.count, outputs.count)
        print("==========================================")
    }
    
}

