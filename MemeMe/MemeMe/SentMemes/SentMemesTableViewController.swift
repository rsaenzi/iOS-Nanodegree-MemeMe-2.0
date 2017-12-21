//
//  SentMemesTableViewController.swift
//  MemeMe
//
//  Created by Rigoberto Saenz on 12/20/17.
//  Copyright © 2017 Rigoberto Sáenz Imbacuán. All rights reserved.
//

import UIKit

class SentMemesTableViewController: UIViewController {
    
    @IBOutlet weak var tableMemes: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableMemes.delegate = self
        tableMemes.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableMemes.reloadData()
    }
}

extension SentMemesTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showMemeDetail(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension SentMemesTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("App Delegate does not exist")
        }
        return app.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("App Delegate does not exist")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesTableCell", for: indexPath) as! SentMemesTableCell
        cell.imageMeme.image = app.memes[indexPath.row].imageMeme
        cell.labelTop.text = app.memes[indexPath.row].textTop
        cell.labelBottom.text = app.memes[indexPath.row].textBottom
        return cell
    }
}
