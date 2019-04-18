//
//  SquareShape.swift
//  DiabetesGame
//
//  Created by Student on 2/25/17.
//  Copyright © 2017 Student. All rights reserved.
//

class SquareShape:Shape {
    
    override var blockRowColumnPositions: [Orientation: Array<(columnDiff:
        Int, rowDiff: Int)>] {
        
        return [
            
            Orientation.zero: [(0, 0), (1, 0), (0, 1), (1, 1)],
            
            Orientation.oneEighty: [(0, 0), (1, 0), (0, 1), (1, 1)],
            
            Orientation.ninety: [(0, 0), (1, 0), (0, 1), (1, 1)],
            
            Orientation.twoSeventy: [(0, 0), (1, 0), (0, 1), (1, 1)]
            
        ]
    }
    
    override var bottomBlocksForOrientations: [Orientation : Array<Block>] {
        
        return [
        
            Orientation.zero: [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
            
            Orientation.oneEighty: [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
            
            Orientation.ninety: [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]],
            
            Orientation.twoSeventy: [blocks[ThirdBlockIdx], blocks[FourthBlockIdx]]
            
        ]
    }
}
