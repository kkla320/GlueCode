extension Stylesheet {
    public init(@SassComponentBuilder content: () -> [SassComponent]) {
        self.init(components: content())
    }
}
