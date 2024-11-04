//
//  View+Extensions.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/4/24.
//

import Foundation
import AppKit
import SwiftUI

extension View {
    
    @discardableResult
    func openInWindow(title: String, sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let window = NSWindow(contentViewController: controller)
        window.contentViewController = controller
        window.title = title
        window.makeKeyAndOrderFront(sender)
        return window
    }
    
}
