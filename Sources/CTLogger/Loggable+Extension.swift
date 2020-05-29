import Foundation
public extension Loggable{
    
    private func formatCode() -> String{
        return String(format: "%0\(Self.digitAmount)d", self.rawValue)
    }
    
    private func formatMessage() -> String{
        //not that nice but allows to get string representation of enum associated values, as we do not have a nice generic way of doing it, should we use Mirror ?
        let elementMirror = Mirror(reflecting: self)
        let caseName = String(describing: self)
        let args: [String] = elementMirror.children.filter {$0.label != nil}
            .map { child -> (label: String, args: [String]) in
                let extractedTupleValues: [String] = Mirror(reflecting: child.value).children.map { String(describing: $0.value) }
                return (label: child.label!,
                        args: extractedTupleValues.isEmpty
                            ? [String(describing: child.value)]
                            : extractedTupleValues)
        }
            .map { element in
                String(format: i18n(element.label), arguments: element.args)
        }
        return args.isEmpty ? caseName : args.joined(separator: "\n")
    }
    
    private func i18n(_ key: String) -> String {
        let lookupKey = "\(loggerPrefix)_\(key)"
        print(lookupKey)
        let translatedList = Bundle.allBundles.compactMap{
            NSLocalizedString(lookupKey,
                tableName: LoggableConfig.localizableFileName,
                bundle: $0,
                comment: "")
        }
        guard let translated = translatedList.first(where: { $0 != lookupKey})
            else { return "\(key) %@" }
        return translated.isEmpty || translated == key ? "\(key) %@" : translated
    }
    
    static var digitAmount: Int {
        return 4
    }
    
    var loggerPrefix: String {
        return LoggerNameUtils.extractUpperCased(from: "\(type(of: self))")
    }
    
    var message: String{
        return "[\(loggerPrefix)\(formatCode())] - \(formatMessage())"
    }
    
    func debug(){
        LoggableConfig.facility.debug(message)
    }
    
    func log(){
        LoggableConfig.facility.log(message)
    }
    
    func warn(){
        LoggableConfig.facility.warn(message)
    }
    
    func error(){
        LoggableConfig.facility.error(message)
    }
    
    func fatal(){
        LoggableConfig.facility.fatal(message)
    }
}
