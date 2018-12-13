//
//  GameViewController.swift
//  Tetris
//
//  Created by Period 1 on 12/6/18.
//  Copyright © 2018 DGS. All rights reserved.

import UIKit
import SpriteKit
import GameplayKit

 class GameViewController: UIViewController, SwiftrisDelegate, UIGestureRecognizerDelegate {
    
    var scene: GameScene!
    var swiftris:Swiftris!
    
    // #1
    var panPointReference:CGPoint?

    override func viewDidLoad() {
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


    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
    
        // #2
        let currentPoint = sender.translationInView(self.view)
        if let originalPoint = panPointReference {
            // #3
            if abs(currentPoint.x - originalPoint.x) > (BlockSize * 0.9) {
                // #4
                if sender.velocityInView(self.view).x > CGFloat(0) {
                    swiftris.moveShapeRight()
                    panPointReference = currentPoint
                } else {
                    swiftris.moveShapeLeft()
                    panPointReference = currentPoint
                }
            }
        } else if sender.state == .Began {
            panPointReference = currentPoint
        }
    
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        swiftris.rotateShape()
    }
    
    func didTick() {
        swiftris.fallingShape?.lowerShapeByOneRow()
        scene.redrawShape(shape: swiftris.fallingShape!, completion: {})
    }

}
