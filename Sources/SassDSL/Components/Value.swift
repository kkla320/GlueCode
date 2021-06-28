public enum Value {
    case string(String)
    case bool(Bool)
    case null
    case number(Double, String?)
    case color(Color)
    case list([Value])
}

extension Value: CustomStringConvertible {
    public var description: String {
        switch self {
        case .string(let string):
            return "\"\(string)\""
        case .bool(let bool):
            return bool ? "true" : "false"
        case .null:
            return "null"
        case .number(let number, let unit):
            if let unit = unit {
                return "\(number)\(unit)"
            }
            return "\(number)"
        case .color(let color):
            return color.description
        case .list(let values):
            return values.map({ $0.description }).joined(separator: " ")
        }
    }
}
