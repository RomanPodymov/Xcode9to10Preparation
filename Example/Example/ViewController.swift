//
//  ViewController.swift
//  Example
//
//  Created by Роман Подымов on 19.06.2018.
//  Copyright © 2018 roman.podymov. All rights reserved.
//

import UIKit
import Xcode9to10Preparation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let testingValue = [1, 2, 3].allSatisfy { $0 > 0 }
        print(testingValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

