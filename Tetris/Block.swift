//
//  Block.swift
//  Tetris
//
//  Created by Period 1 on 12/10/18.
//  Copyright © 2018 DGS. All rights reserved.
//

import SpriteKit


class Block: Equatable
{
    let color: BlockColor
    
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String
    {
        return color.rawValue
    }
    
    var description: String
    {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color:BlockColor)
    {
        self.column = column
        self.row = row
        self.color = color
        self.sprite = nil
    }
    
    static func ==(lhs: Block, rhs: Block) -> Bool {
        return lhs.column^lhs.row^lhs.color.rawValue.hashValue == rhs.column^rhs.row^rhs.color.rawValue.hashValue
    }
}

enum BlockColor: String
{
    case Blue = "blue"
    case Orange = "orange"
    case Purple = "purple"
    case Red = "red"
    case Teal = "teal"
    case Yellow = "yellow"
    case White = "white"
    case Pewds = "pewds"
    //More colors
    
    static func random() -> BlockColor
    {
        let all: [BlockColor] = [.Blue, .Orange, .Purple, .Red, .Teal, .Yellow, .White, .Pewds]
        return all[Int(arc4random()) % all.count]
    }
}
