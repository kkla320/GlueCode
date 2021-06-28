//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 24.05.21.
//

import Foundation
import Publish
import Plot

struct Card: Component {
    @ComponentBuilder var contents: () -> ComponentGroup
    
    var body: Component {
        Div {
            for content in contents() {
                Div {
                    content
                }
                .class("card-content")
            }
        }
        .class("card")
    }
}

extension Card {
    init<Site: Website>(item: Item<Site>) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        
        self.init {
            ComponentGroup {
                Link(url: URL(string: item.path.absoluteString)!) {
                    Paragraph(item.title)
                        .class("title")
                }
                
                Paragraph(dateFormatter.string(from: item.date))
                    .class("subtitle")
            }
            
            Paragraph(item.description)
        }
    }
}
