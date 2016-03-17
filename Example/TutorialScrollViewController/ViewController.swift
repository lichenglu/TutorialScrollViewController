//
//  ViewController.swift
//  TutorialScrollViewController
//
//  Created by Chenglu Li on 03/17/2016.
//  Copyright (c) 2016 Chenglu Li. All rights reserved.
//

import UIKit
import TutorialScrollViewController

class ViewController: TutorialScrollViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instantiate your viewControllers that you wanna include in the pageController
        self.controllerStoryboardIds = ["Red","Green","Blue"]
        
        // Enable pageLooping so that you can loop around pages
        self.enablePageLooping = true
        
        // Whether to show pageControl or not
        self.pageControlIsHidden = false
        
        // Adjust pageControl's y position
        self.pageControlYPosition = 80.0
        
        // Adjust pageControl's x position
        self.pageControlXPosition = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

