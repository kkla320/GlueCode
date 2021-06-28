@resultBuilder
public struct SassComponentBuilder {
    public static func buildBlock(_ components: SassComponent...) -> [SassComponent] {
        return components
    }
    
    public static func buildIf(_ value: [SassComponent]?) -> [SassComponent] {
        value ?? []
    }
    
    public static func buildIf(_ value: SassComponent?) -> SassComponent {
        value ?? EmptyComponent()
    }
    
    public static func buildEither(first component: [SassComponent]) -> [SassComponent] {
        return component
    }
    
    public static func buildEither(second component: [SassComponent]) -> [SassComponent] {
        return component
    }
}

public struct EmptyComponent: SassComponent, Renderable {
    public var body: SassComponent {
        self
    }
    
    public func render(renderer: inout SassRenderer, options: RenderOptions) {
        
    }
}

//extension Array: SassComponent, Renderable where Element: SassComponent {
//    public var body: SassComponent {
//        self
//    }
//
//    public func render(renderer: inout SassRenderer, options: RenderOptions) {
//        for component in self {
//            renderer.renderComponent(component, options: options)
//        }
//    }
//}

public struct Group: SassComponent, Renderable {
    public var components: [SassComponent]
    
    public var body: SassComponent {
        self
    }
    
    public init(@SassComponentBuilder content: () -> [SassComponent]) {
        self.components = content()
    }
    
    public func render(renderer: inout SassRenderer, options: RenderOptions) {
        for component in components {
            renderer.renderComponent(component, options: options)
        }
    }
}
