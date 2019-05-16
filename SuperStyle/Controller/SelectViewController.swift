//
//  SelectViewController.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/3/26.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    var features = Feature.features
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currentCell = sender as? FeatureCell,
            let vc = segue.destination as? FeatureViewController {
            vc.feature = currentCell.feature
            vc.featureNumber = self.collectionView.indexPath(for: currentCell)?.item
        }
    }
    
}

extension SelectViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: collection view setup
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return features.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? FeatureCell)!
        cell.feature = features[indexPath.item]
        return cell
    }
    
}

