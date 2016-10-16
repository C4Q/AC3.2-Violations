//
//  ViewController.swift
//  AC3.2-Violations
//
//  Created by Jason Gresh on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var recordOfViolation: Violation?
    
    
    
    @IBOutlet weak var boroLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        boroLabel.text = recordOfViolation?.boro
        streetLabel.text = recordOfViolation?.street
        buildingLabel.text = recordOfViolation?.building
        descriptionLabel.text = recordOfViolation?.description
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

