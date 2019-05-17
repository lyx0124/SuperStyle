//
//  MenuViewController.swift
//  SuperStyle
//
//  Created by 刘宇翔 on 2019/3/20.
//  Copyright © 2019 leo. All rights reserved.
//

import UIKit
import Hero

class MenuViewController: UIViewController {
    
    var sections = Section.sections
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.alwaysBounceVertical = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currentCell = sender as? SectionCell,
            let vc = segue.destination as? IntroViewController {
            vc.section = currentCell.section
        }
    }
    
}

extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: colletion view setup
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? SectionCell)!
        cell.section = sections[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height / CGFloat(sections.count))
    }
    
}
