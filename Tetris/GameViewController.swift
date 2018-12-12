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
    var swiftris:Swiftris!

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
            
            scene.tick = didTick
            
            swiftris = Swiftris()
            swiftris.beginGame()
            
            // Present the scene.
            skView.presentScene(scene)
            
            scene.addPreviewShapeToScene(shape: swiftris.nextShape!) {
                self.swiftris.nextShape?.moveTo(column: StartingColumn, row: StartingRow)
                self.scene.movePreviewShape(shape: self.swiftris.nextShape!) {
                    let nextShapes = self.swiftris.newShape()
                    self.scene.startTicking()
                    self.scene.addPreviewShapeToScene(shape: nextShapes.nextShape!) {}
                }
            }
        }
        
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func didTick() {
        swiftris.fallingShape?.lowerShapeByOneRow()
        scene.redrawShape(shape: swiftris.fallingShape!, completion: {})
    }
}
