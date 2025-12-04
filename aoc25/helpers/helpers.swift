final class Helpers {
    /// Returns int value in string at some index
    /// It does not check for anything
    static func value(at index: Int, in line: String) -> Int {
        let stringIndex = line.index(line.startIndex, offsetBy: index)
        let ch = line[stringIndex]
        return Int(String(ch))!
    }
    
    /// Returns int value in substring at some index
    /// It does not check for anything
    static func value(at index: Int, in line: String.SubSequence) -> Int {
        return value(at: index, in: String(line))
    }
    
    /// Splits string in two halfs
    /// It does not check  if the length is an even number
    static func splitInHalf(_ s: String) -> (String, String) {
        let midOffset = s.count / 2
        let midIndex = s.index(s.startIndex, offsetBy: midOffset)
        let left = String(s[..<midIndex])
        let right = String(s[midIndex...])
        return (left, right)
    }
    
    /// Splits a string into a n parts (of equal length)
    /// Returns [] if string cannot be split evenly
    static func split(_ s: String, into parts: Int) -> [String] {
        let total = s.count
        
        let baseSize = total / parts
        let remainder = total % parts
        
        if remainder != 0 {
            return []
        }
        
        var result: [String] = []
        result.reserveCapacity(parts)
        
        var start = s.startIndex
        for i in 0..<parts {
            let extra = i < remainder ? 1 : 0
            let length = baseSize + extra
            let end = s.index(start, offsetBy: length)
            result.append(String(s[start..<end]))
            start = end
        }
        return result
    }
    
    /// Adds value to the position in the array
    /// If it is outside of bounds, it does not fail
    static func safeAdd(_ value: Int, to values: inout [[Int]], at: (Int, Int), with size: (Int, Int)) {
        if at.0 >= 0, at.0 < size.0, at.1 >= 0, at.1 < size.1 {
            values[at.0][at.1] += value
        }
    }
}
