//
//  GameTableViewCell.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import UIKit
import Kingfisher

class GameTableViewCell: UITableViewCell {

    @IBOutlet weak var ivCover: UIImageView!
    @IBOutlet weak var lTitle: UILabel!
    @IBOutlet weak var lChannels: UILabel!
    @IBOutlet weak var lViewers: UILabel!
    
    var coverURL: URL?
    var title: String?
    var channels: Int?
    var viewers: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func commonInit() {
        lTitle.text = title
        lChannels.text = "ch: \(channels ?? 0)"
        lViewers.text = "v: \(viewers ?? 0)"
        ivCover.kf.indicatorType = .activity
        ivCover.kf.setImage(with: coverURL)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
