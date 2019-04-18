//
//  GameViewController.swift
//  DiabetesGame
//
//  Created by Student on 2/3/17.
//  Copyright (c) 2017 Student. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    var scene: GameScene!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure the view
        let skView = view as! SKView
        
        skView.isMultipleTouchEnabled = false
        
        //Create and configure the scene
        
        scene = GameScene(size: skView.bounds.size)
        
        scene.scaleMode = .aspectFill
        
        //present the scene
        skView.presentScene(scene)

    }


    override var prefersStatusBarHidden : Bool {
        return true
    }
}
