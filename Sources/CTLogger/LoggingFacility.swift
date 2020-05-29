public protocol LoggingFacility{
    var isDebugEnabled: Bool { get }
    var isLogEnabled: Bool { get }
    var isWarnEnabled: Bool { get }
    var isErrorEnabled: Bool { get }
    var isFatalEnabled: Bool { get }
    func debug(_ msg: String)
    func log(_ msg: String)
    func warn(_ msg: String)
    func error(_ msg: String)
    func fatal(_ msg: String)
}
