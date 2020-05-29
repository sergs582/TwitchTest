//
//  TopStreamsViewController.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import UIKit

class TopStreamsViewController: UIViewController {

    @IBOutlet weak var streamsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStreamsTable()
    }
    
    func setupStreamsTable() {
        streamsTable.dataSource = self
        streamsTable.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "gamecell")
    }

}

extension TopStreamsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gamecell") as! GameTableViewCell
        cell.lTitle.text = "\(indexPath.row)"
        return cell
    }
    
}
