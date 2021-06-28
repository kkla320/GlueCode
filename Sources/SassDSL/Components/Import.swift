public struct Import: Renderable, SassComponent {
    var path: String
    
    public var body: SassComponent {
        self
    }
    
    public init(path: String) {
        self.path = path
    }
    
    public func render(renderer: inout SassRenderer, options: RenderOptions) {
        renderer.renderImport(path: path)
    }
}
