//
//  Shape.swift
//  DiabetesGame
//
//  Created by Student on 2/25/17.
//  Copyright © 2017 Student. All rights reserved.
//

import SpriteKit

let NumOrientations: UInt32 = 4

enum Orientation: Int, CustomStringConvertible {
    
    case zero = 0, ninety, oneEighty, twoSeventy
    
    var description: String {
        
        switch self {
            
        case .zero:
            
            return "0"
        
        case .ninety:
            
            return "90"
            
        case .oneEighty:
            
            return "180"
            
        case .twoSeventy:
            
            return "270"
            
        }
    }
    
    static func random() -> Orientation {
        
        return Orientation(rawValue:Int(arc4random_uniform(NumOrientations)))!
        
    }
    
    static func rotate(_ orientation:Orientation, clockwise: Bool) ->Orientation {
        
        var rotated = orientation.rawValue + (clockwise ? 1: -1)
        
        if rotated > Orientation.twoSeventy.rawValue {
            
            rotated = Orientation.zero.rawValue
            
        } else if rotated < 0 {
            
            rotated = Orientation.twoSeventy.rawValue
            
        }
        
        return Orientation(rawValue:rotated)!
    }
}

//the number of total shape varieties

let NumShapeTypes: UInt32 = 7

//shape indexes

let FirstBlockIdx: Int = 0

let SecondBlockIdx: Int = 1

let ThirdBlockIdx: Int = 2

let FourthBlockIdx: Int = 3


class Shape: Hashable, CustomStringConvertible {
    
    //the color of the shape
    
    let color: BlockColor
    
    //the blocks comprising the shape
    
    var blocks = Array<Block>()
    
    //the current orientation of the shape
    
    var orientation: Orientation
    
    //the column and row representing the shape's anchor point
    
    var column, row: Int
    
    //required Overrides
    
    //subclasses must override this property
    
    var blockRowColumnPositions: [Orientation: Array<(columnDiff: Int, rowDiff: Int)>] {
        
        return [:]
        
    }
    
    //subclasses must override this property
    
    var bottomBlocksForOrientations: [Orientation: Array<Block>] {
        
        return [:]
        
    }
    
    var bottomBlocks: Array<Block> {
        
        guard let bottomBlocks = bottomBlocksForOrientations[orientation]
        
        else{
                return []
                
        }
        
        return bottomBlocks
    }
    
    //Hashable
    
    var hashValue: Int {
        
        return blocks.reduce(0) { $0.hashValue ^ $1.hashValue }
        
    }
    
    //CustomStringConvertible
    
    var description:String {
        
        return "\(color) block facing \(orientation): \(blocks[FirstBlockIdx]), \(blocks[SecondBlockIdx]), \(blocks[ThirdBlockIdx]), \(blocks[FourthBlockIdx])"
    }
    
    init(column:Int, row:Int, color:BlockColor, orientation:Orientation) {
        
        self.color = color
        
        self.column = column
        
        self.row = row
        
        self.orientation = orientation
        
        initializeBlocks()
        
        
    }
    
    convenience init(column:Int, row:Int) {
        
        self.init(column:column, row:row, color:BlockColor.random(), orientation: Orientation.random())
        
    }
    
    final func initializeBlocks() {
        
        guard let blockRowColumnTranslations = blockRowColumnPositions[orientation] else {
            
            return
            
        }
        
        blocks = blockRowColumnTranslations.map { (diff) -> Block in
            
            return Block(column: column + diff.columnDiff, row: row + diff.rowDiff, color: color)
        }
        
    }
}

func ==(lhs: Shape, rhs: Shape) -> Bool {

    return lhs.row == rhs.row && lhs.column == rhs.column
}
