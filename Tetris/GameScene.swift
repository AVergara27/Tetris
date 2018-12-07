//
//  GameScene.swift
//  Tetris
//
//  Created by Period 1 on 12/6/18.
//  Copyright © 2018 DGS. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoder not supported")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
    }
}
