public struct Variable: Renderable, SassComponent {
    private var name: String
    private var value: Value
    
    public var body: SassComponent {
        self
    }
    
    public init(name: String, value: Value) {
        self.name = name
        self.value = value
    }
    
    public func render(renderer: inout SassRenderer, options: RenderOptions) {
        renderer.renderVariable(name: name, value: value)
    }
}
