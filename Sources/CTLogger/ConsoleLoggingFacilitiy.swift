public class ConsoleLoggingFacility: LoggingFacility{
    public var isDebugEnabled: Bool = true
    
    public var isLogEnabled: Bool = true
    
    public var isWarnEnabled: Bool = true
    
    public var isErrorEnabled: Bool = true
    
    public var isFatalEnabled: Bool = true
    
    public func debug(_ msg: String){
        debugPrint(msg)
    }
    public func log(_ msg: String){
        print(msg)
    }
    public func warn(_ msg: String){
        print(msg)
    }
    public func error(_ msg: String){
        print(msg)
    }
    public func fatal(_ msg: String){
        print(msg)
    }
}
