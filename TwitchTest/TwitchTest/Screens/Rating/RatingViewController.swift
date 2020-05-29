//
//  RatingViewController.swift
//  TwitchTest
//
//  Created by Сергей on 29.05.2020.
//  Copyright © 2020 Sunmait. All rights reserved.
//

import UIKit
import RateView

class RatingViewController: UIViewController {

    @IBOutlet weak var reviewText: UITextView!
    @IBOutlet weak var rating: RateView!
    @IBOutlet weak var rateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        rating.canRate = true
        rateButton.layer.cornerRadius = 4
    }
    
    @IBAction func sendReview(_ sender: Any) {
        print("Review sent with rating \(rating.rating) and description: \(reviewText.text ?? "")")
    }


}
