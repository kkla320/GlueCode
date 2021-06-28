public struct Margin: SassComponent {
    private var value: Value
    
    public init(amount: Double, unit: String?) {
        value = .number(amount, unit)
    }
    
    public var body: SassComponent {
        Property(name: "margin", value: value)
    }
}
