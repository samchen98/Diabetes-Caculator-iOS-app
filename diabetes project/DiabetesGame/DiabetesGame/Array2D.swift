//
//  Array2D.swift
//  DiabetesGame
//
//  Created by Student on 2/25/17.
//  Copyright © 2017 Student. All rights reserved.
//

class Array2D<T> {
    
    let columns: Int
    let rows: Int
    
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        
        self.columns = columns
        
        self.rows = rows
        
        array = Array<T?>(repeating: nil, count: rows * columns)
    }
    
    subscript(column: Int, row: Int) -> T? {
        
        get {
            
            return array[(row*columns) + column]
            
        }
        
        set(newValue) {
            
            array[(row * columns) + column] = newValue
        }
    }
}
