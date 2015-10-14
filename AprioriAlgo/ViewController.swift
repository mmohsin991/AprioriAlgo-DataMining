//
//  ViewController.swift
//  AprioriAlgo
//
//  Created by Mohsin on 14/10/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        AprioriAlgo().start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

