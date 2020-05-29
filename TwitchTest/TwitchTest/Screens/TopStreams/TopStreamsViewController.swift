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
        viewModel = TopStreamsViewModel(apiManager: APITwitchStreamManager())
        viewModel.twitchStreamsArray.bind { _ in
            DispatchQueue.main.async {
                self.streamsTable.reloadData()
            }
            
        }
    }
    var viewModel: TopStreamsViewModel!
    
    func setupStreamsTable() {
        streamsTable.dataSource = self
        streamsTable.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "gamecell")
    }

}

extension TopStreamsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.twitchStreamsArray.value!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gamecell") as! GameTableViewCell
        let stream = viewModel.twitchStreamsArray.value?[indexPath.row]
        cell.coverURL = URL(string: (stream?.game.box.medium)!)
        cell.title = stream?.game.name
        cell.channels = stream?.channels
        cell.viewers = stream?.viewers
        cell.commonInit()
        return cell
    }
    
}
