import Foundation


func isProperly(sequence: String) -> Bool {
    let str = sequence.replacingOccurrences(of: "()", with: "")
    switch str {
    case "": return true
    case sequence: return false
    default: return isProperly(sequence: str)
    }
}