//
//  ViewController.swift
//  Example
//
//  Created by Roman Podymov on 19.06.2018.
//  Copyright © 2018 roman.podymov. All rights reserved.
//

import UIKit
import Xcode9to10Preparation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let testingValue1 = [1, 2, 3].allSatisfy { $0 > 0 }
        print(testingValue1)
        
        var testingValue2 = [1, 10, 4, 20, 6, 7, 30, 8, 2]
        testingValue2.removeAll(where: { $0 < 10 })
        print(testingValue2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

