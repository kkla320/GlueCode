public struct SassRenderer {
    private var options: SassRendererOptions
    
    public var result: String = ""
    
    public init(options: SassRendererOptions) {
        self.options = options
    }
    
    public mutating func renderVariable(name: String, value: Value) {
        result.append("$\(name): \(value.description);\(options.lineBreak)")
    }
    
    public mutating func renderImport(path: String) {
        result.append("@import \"\(path)\";\(options.lineBreak)")
    }
    
    public mutating func renderSelector(selector: String, body: (inout SassRenderer) -> Void) {
        result.append("\(selector) {\(options.lineBreak)")
        body(&self)
        result.append("}\(self.options.lineBreak)")
    }
    
    public mutating func renderProperty(name: String, value: Value, options: RenderOptions) {
        let intendation = String(repeating: self.options.intendation, count: options.intendationCount)
        result.append("\(intendation)\(name): \(value);\(self.options.lineBreak)")
    }
}

public struct SassRendererOptions {
    public private(set) var lineBreak: String = "\n"
    public private(set) var intendation: String = "\t"
    
    public init(
        lineBreak: String = "\n",
        intendation: String = "\t"
    ) {
        self.lineBreak = lineBreak
        self.intendation = intendation
    }
}
