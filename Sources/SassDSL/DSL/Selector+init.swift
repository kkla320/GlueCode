extension Selector {
    public init(selector: String, @SassComponentBuilder content: () -> [SassComponent]) {
        self.init(selector: selector, components: content())
    }
}
