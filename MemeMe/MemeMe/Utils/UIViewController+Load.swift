//
//  UIViewController+Load.swift
//  MemeMe
//
//  Created by Rigoberto Sáenz Imbacuán on 12/20/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showMemeDetail(_ indexPath: IndexPath) {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("App Delegate does not exist")
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let screen = storyboard.instantiateViewController(withIdentifier: "MemeDetailViewController") as? MemeDetailViewController else {
            return
        }
        screen.meme = app.memes[indexPath.row].imageMeme
        navigationController?.pushViewController(screen, animated: true)
    }
}
