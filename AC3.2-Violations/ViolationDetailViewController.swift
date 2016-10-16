//
//  ViolationDetailViewController.swift
//  AC3.2-Violations
//
//  Created by Tom Seymour on 10/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationDetailViewController: UIViewController {
    
    var thisViolatingRestaurant: ViolatingRestaurant!

    @IBOutlet weak var gradeImageView: UIImageView!
    @IBOutlet weak var dateScoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cuisineTypeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var violationDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayDetailScreen()
    }
    
    func displayDetailScreen() {
        self.navigationItem.title = thisViolatingRestaurant.name
        
        dateScoreLabel.text = "\(thisViolatingRestaurant.date)\n Score: \(thisViolatingRestaurant.score)"
        
        if let imageName = thisViolatingRestaurant.grade {
            gradeImageView.image = UIImage(named: imageName)
        } else {
            gradeImageView.image = UIImage(named: "P")
        }
        
        nameLabel.text = thisViolatingRestaurant.name
        cuisineTypeLabel.text = "Type of Cuisine: \(thisViolatingRestaurant.cuisineDescription)"
        addressLabel.text = "\(thisViolatingRestaurant.addressString)\nPhone: \(thisViolatingRestaurant.phone)"
        actionLabel.text = thisViolatingRestaurant.action
        violationDescriptionLabel.text = "Violation Code: \(thisViolatingRestaurant.violationCode)\n\(thisViolatingRestaurant.violationDescription)"
    }
}
