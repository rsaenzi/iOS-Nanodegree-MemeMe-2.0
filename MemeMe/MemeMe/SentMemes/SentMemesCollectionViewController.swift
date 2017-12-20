//
//  SentMemesCollectionViewController.swift
//  MemeMe
//
//  Created by Rigoberto Saenz on 12/20/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

class SentMemesCollectionViewController: UIViewController {
 
    @IBOutlet weak var collectionMemes: UICollectionView!
    
    override func viewDidLoad() {
        collectionMemes.delegate = self
        collectionMemes.dataSource = self
    }
}

extension SentMemesCollectionViewController: UICollectionViewDelegate {
    
}

extension SentMemesCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return 0
        }
        return app.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionCell", for: indexPath)
        return cell
    }
}
