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
        tableMemes.delegate = self
        tableMemes.dataSource = self
    }
}

extension SentMemesTableViewController: UITableViewDelegate {
    
}

extension SentMemesTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return 0
        }
        return app.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemesTableCell", for: indexPath)
        return cell
    }
}
