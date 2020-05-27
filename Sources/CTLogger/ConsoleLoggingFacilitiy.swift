public class ConsoleLoggingFacility: LoggingFacility{
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
