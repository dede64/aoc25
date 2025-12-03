import Foundation

class Day2Easy {
    func solve() {
        var solution = 0
        
        let ranges = input.split(separator: ",").map {
            let content = String($0).trimmingCharacters(in: .whitespacesAndNewlines).split(separator: "-")
            
            return [
                Int(content[0])!,
                Int(content[1])!
            ]
        }
        
        for range in ranges {
            for i in range[0]...range[1] {
                let strVal = String(i)
                let isEvenLength = strVal.count % 2 == 0 && strVal.count > 1
                if isEvenLength {
                    let parts = splitInHalf(strVal)
                    
                    if parts.0 == parts.1 {
                        solution += i
                    }
                }
            }
        }
        
        print(solution)
    }
    
    func splitInHalf(_ s: String) -> (String, String) {
        let midOffset = s.count / 2
        let midIndex = s.index(s.startIndex, offsetBy: midOffset)
        let left = String(s[..<midIndex])
        let right = String(s[midIndex...])
        return (left, right)
    }
    
    let easyInput: String = """
    11-22,95-115,998-1012,1188511880-1188511890,222220-222224,
    1698522-1698528,446443-446449,38593856-38593862,565653-565659,
    824824821-824824827,2121212118-2121212124
    """
    
    let input: String = """
    199617-254904,7682367-7856444,17408-29412,963327-1033194,938910234-938964425,3207382-3304990,41-84,61624-105999,1767652-1918117,492-749,85-138,140-312,2134671254-2134761843,2-23,3173-5046,16114461-16235585,3333262094-3333392446,779370-814446,26-40,322284296-322362264,6841-12127,290497-323377,33360-53373,823429-900127,17753097-17904108,841813413-841862326,518858-577234,654979-674741,773-1229,2981707238-2981748769,383534-468118,587535-654644,1531-2363
    """
}
