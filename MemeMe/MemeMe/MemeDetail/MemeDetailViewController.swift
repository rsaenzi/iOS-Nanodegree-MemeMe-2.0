//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Rigoberto Saenz on 12/20/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var memeImage: UIImageView!
    var meme: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memeImage.image = meme
    }
}
