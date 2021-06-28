public protocol SassComponent {
    var body: SassComponent { get }
}

extension SassRenderer {
    mutating func renderComponent(_ component: SassComponent, options: RenderOptions) {
        if let renderable = component as? Renderable {
            renderable.render(renderer: &self, options: options)
        }
        else {
            self.renderComponent(component.body, options: options)
        }
    }
}

public struct RenderOptions {
    public private(set) var intendationCount: Int = 0
    
    public init(intendationCount: Int = 0) {
        self.intendationCount = intendationCount
    }
}

public protocol Renderable {
    func render(renderer: inout SassRenderer, options: RenderOptions)
}
