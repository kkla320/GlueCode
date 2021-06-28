//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 24.05.21.
//

import Foundation
import Plot

struct Container<Content: Component>: Component {
    @ComponentBuilder var content: () -> Content
    
    var body: Component {
        Div {
            content()
        }
        .class("container")
        .class("is-fluid")
    }
}
