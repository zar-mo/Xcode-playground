// Array - 5 - Rotate array elements from left to right by n position.

enum RotateDirection{
    case left
    case right
}

func rotateArray(input: inout [Any], direction: RotateDirection, positionNum: Int) -> [Any] {

    
    let l = input.count
    let n = positionNum % l
    switch direction{
        case .right:
        for _ in 0...n {
           if let last = input.last{
               input.remove(at: l-1)
               input.insert(last, at: 0)
           }
        }
        
        case .left:
        for _ in 0...n {
            if let first = input.first{
            
               input.remove(at: 0)
               input.append(first)
                
            }
        }
    }
    
    print("output:    \(input)")
    return input
   
}

var input: [Any] = [1, 2, 3, 4, 5, 6]
rotateArray(input: &input, direction: .right, positionNum: 3)

//time complxity O(n) where n is positionNum
//space complexity is O(1)
