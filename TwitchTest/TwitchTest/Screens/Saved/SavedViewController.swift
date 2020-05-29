//
//  SavedViewController.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import UIKit

class SavedViewController: UIViewController {

    @IBOutlet weak var streamsTable: UITableView!
    var viewModel: SavedViewViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = SavedViewViewModel()
        
        viewModel.twitchStreamsArray.bind { _ in
            DispatchQueue.main.async {
                self.streamsTable.reloadData()
            }
        }
        setupStreamsTable()
    }
    
    func setupStreamsTable() {
        
        streamsTable.dataSource = self
        streamsTable.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "gamecell")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SavedViewController: UITableViewDataSource {
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
