public protocol LoggingFacility{
    func debug(_ msg: String)
    func log(_ msg: String)
    func warn(_ msg: String)
    func error(_ msg: String)
    func fatal(_ msg: String)
}
