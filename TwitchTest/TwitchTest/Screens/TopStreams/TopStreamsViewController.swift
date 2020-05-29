//
//  TopStreamsViewController.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import UIKit

class TopStreamsViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var streamsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = TopStreamsViewModel(apiManager: APITwitchStreamManager())
        viewModel.twitchStreamsArray.bind { _ in
            DispatchQueue.main.async {
                self.streamsTable.reloadData()
            }
        }
        setupStreamsTable()
    }
    var viewModel: TopStreamsViewModel!
    var page = 0
    
    func setupStreamsTable() {
        
        streamsTable.dataSource = self
        streamsTable.delegate = self
        streamsTable.tableFooterView = UIView(frame: .zero)
        streamsTable.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "gamecell")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height && !viewModel.isLoading{
            page += 10
            viewModel.isLoading = true
            viewModel.fetchStreams(page: page)
        }
    }

}

extension TopStreamsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.twitchStreamsArray.value?.count ?? 0
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
