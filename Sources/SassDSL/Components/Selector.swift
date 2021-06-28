public struct Selector: Renderable, SassComponent {
    private var selector: String
    private var components: [SassComponent]
    
    public var body: SassComponent {
        self
    }
    
    public init(selector: String, components: [SassComponent]) {
        self.selector = selector
        self.components = components
    }
    
    public func render(renderer: inout SassRenderer, options: RenderOptions) {
        renderer.renderSelector(selector: selector) { renderer in
            for component in components {
                renderer.renderComponent(component, options: RenderOptions(intendationCount: options.intendationCount + 1))
//                component.render(renderer: &renderer, options: RenderOptions(intendationCount: options.intendationCount + 1))
            }
        }
    }
}

public struct Property: Renderable, SassComponent {
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
        renderer.renderProperty(name: name, value: value, options: options)
    }
}
