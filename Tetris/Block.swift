//
//  Block.swift
//  Tetris
//
<<<<<<< HEAD
//  Created by Period 1 on 12/7/18.
=======
//  Created by Period 1 on 12/10/18.
>>>>>>> 9d8e6a9b7ba050391447bbc911f7351217c41ed9
//  Copyright © 2018 DGS. All rights reserved.
//

import SpriteKit

<<<<<<< HEAD
// #1
let NumberOfColors: UInt32 = 6

// #2
enum BlockColor: Int, CustomStringConvertible {
    
    // #3
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // #4
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    // #5
    var description: String {
        return self.spriteName
    }
    
    // #6
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
    
=======
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
    
    static func random() -> BlockColor
    {
        let all: [BlockColor] = [.Blue, .Orange, .Purple, .Red, .Teal, .Yellow]
        return all[Int(arc4random()) % all.count]
    }
>>>>>>> 9d8e6a9b7ba050391447bbc911f7351217c41ed9
}
