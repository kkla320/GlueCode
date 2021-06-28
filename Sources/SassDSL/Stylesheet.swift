public struct Stylesheet {
    private var components: [SassComponent]
    
    public init(components: [SassComponent]) {
        self.components = components
    }
    
    public func asString() -> String {
        var renderer = SassRenderer(options: SassRendererOptions())
        for component in components {
            renderer.renderComponent(component, options: RenderOptions())
//            component.render(renderer: &renderer, options: RenderOptions())
        }
        return renderer.result
    }
}
