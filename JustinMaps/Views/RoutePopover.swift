//
//  RoutePopover.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/3/24.
//

import Foundation
import AppKit

class RoutePopover: NSPopover {
    
    init(controller: RouteContentViewController) {
        super.init()
        self.contentViewController = controller
        self.contentSize = controller.view.frame.size
        self.behavior = .transient
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
