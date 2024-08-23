import UIKit

//Program to remove the same consecutive char from the input string. E.g. input string: ssuuppperrrrr coooommpuuuuuuuuttttter output should be: super computer

func removeConsecutive(input: inout String) -> String {
    var lastChar: Character? = nil
    var index: Int = 0
    
    for char in input{
        if let last = lastChar, last == char {
            continue
        }else{
            let charIndex = input.index(input.startIndex, offsetBy: index)
            input.replaceSubrange(charIndex..<input.index(after: charIndex), with: String(char))
            index += 1
            lastChar = char

        }
        
    }
    
    let endIndex = input.index(input.startIndex, offsetBy: min(index, input.count))
    input = String(input[..<endIndex])
    print("input:   \(input)")
    return input
}

var input = "ssuuppperrrrr coooommpuuuuuuuuttttttttter"
removeConsecutive(input: &input)
