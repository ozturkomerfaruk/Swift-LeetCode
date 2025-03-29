//
//  StringMedium.swift
//  
//
//  Created by Ömer Faruk Öztürk on 29.03.2025.
//

public class StringMedium {
    
    public init() {}
    
    //6. Zigzag Conversion
    public func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1,
              numRows < s.count else { return s }
        
        var rows = Array(repeating: "", count: numRows)
        var currentRow = 0
        var goingDown = false
        
        for char in s {
            rows[currentRow].append(char)
            
            if currentRow == 0 || currentRow == numRows - 1 {
                goingDown.toggle()
            }
            
            currentRow = goingDown ? currentRow + 1 : currentRow - 1
        }
        
        return rows.joined()
    }
}
