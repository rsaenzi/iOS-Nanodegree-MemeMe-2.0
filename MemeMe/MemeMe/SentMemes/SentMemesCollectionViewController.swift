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
    
    fileprivate let cellSize = UIScreen.main.bounds.width / 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionMemes.delegate = self
        collectionMemes.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionMemes.reloadData()
    }
}

extension SentMemesCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let screen = storyboard.instantiateViewController(withIdentifier: "MemeDetailViewController") as? MemeDetailViewController else {
            return
        }
        screen.meme = app.memes[indexPath.row].imageMeme
        navigationController?.pushViewController(screen, animated: true)
    }
}

extension SentMemesCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return 0
        }
        return app.memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCollectionCell", for: indexPath) as! SentMemesCollectionCell
        cell.imageMeme.image = app.memes[indexPath.row].imageMeme
        return cell
    }
}

extension SentMemesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
