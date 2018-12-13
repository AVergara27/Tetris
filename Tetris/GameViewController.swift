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
            swiftris.delegate = self
            swiftris.beginGame()
            
            // Present the scene.
            skView.presentScene(scene)
        }


    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func didSwipe(_ sender: UISwipeGestureRecognizer) {
    
         swiftris.dropShape()
    
    }
    
    // #5
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // #6
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailByGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer is UISwipeGestureRecognizer {
            if otherGestureRecognizer is UIPanGestureRecognizer {
                return true
            }
        } else if gestureRecognizer is UIPanGestureRecognizer {
            if otherGestureRecognizer is UITapGestureRecognizer {
                return true
            }
        }
        return false
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
    
    func gameShapeDidDrop(swiftris: Swiftris) {
        // #7
        scene.stopTicking()
        scene.redrawShape(swiftris.fallingShape!) {
            swiftris.letShapeFall()
        }
    }
    
    func didTick() {
        swiftris.letShapeFall()
    }
    
    func nextShape() {
        let newShapes = swiftris.newShape()
        guard let fallingShape = newShapes.fallingShape else {
            return
        }
        self.scene.addPreviewShapeToScene(shape: newShapes.nextShape!) {}
        self.scene.movePreviewShape(shape: fallingShape) {
            // #16
            self.view.isUserInteractionEnabled = true
            self.scene.startTicking()
        }
    }
    
    func gameDidBegin(swiftris: Swiftris) {
        // The following is false when restarting a new game
        if swiftris.nextShape != nil && swiftris.nextShape!.blocks[0].sprite == nil {
            scene.addPreviewShapeToScene(shape: swiftris.nextShape!) {
                self.nextShape()
            }
        } else {
            nextShape()
        }
    }
    
    func gameDidEnd(swiftris: Swiftris) {
        view.isUserInteractionEnabled = false
        scene.stopTicking()
    }
    
    func gameDidLevelUp(swiftris: Swiftris) {
        
    }
    
    func gameShapeDidDrop(swiftris: Swiftris) {
        
    }
    
    func gameShapeDidLand(swiftris: Swiftris) {
        scene.stopTicking()
        nextShape()
    }
    
    // #17
    func gameShapeDidMove(swiftris: Swiftris) {
        scene.redrawShape(shape: swiftris.fallingShape!) {}
    }
}
