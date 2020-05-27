import Foundation
struct LoggerNameUtils{
    static func extractUpperCased(from: String) -> String{
        return from.components(separatedBy: .lowercaseLetters).joined()
    }
}
