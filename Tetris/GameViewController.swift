//
//  GameViewController.swift
//  Tetris
//
//  Created by Period 1 on 12/6/18.
//  Copyright © 2018 DGS. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
     var scene: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func viewDidLoad() {
            super.viewDidLoad()
            
            // Configure the view.
            let skView = view as! SKView
            skView.isMultipleTouchEnabled = false
            
            // Create and configure the scene.
            scene = GameScene(size: skView.bounds.size)
            scene.scaleMode = .aspectFill
            
            // Present the scene.
            skView.presentScene(scene)
        }
        
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
}
