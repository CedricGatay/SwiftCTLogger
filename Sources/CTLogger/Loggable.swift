public protocol Loggable{
    static var digitAmount : Int { get }
    var loggerPrefix : String { get }
    var rawValue: Int { get }
    func debug()
    func log()
    func warn()
    func error()
    func fatal()
}


