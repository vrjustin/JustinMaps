//
//  PlaceCalloutView.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/2/24.
//

import Foundation
import AppKit
import MapKit

class PlaceCalloutView: NSView {
    
    private var annotation: PlaceAnnotation
    
    lazy var directionsButton: NSButton = {
        let directionsButton = NSButton(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
        directionsButton.title = "Get Directions"
        directionsButton.wantsLayer = true
        directionsButton.isBordered = false
        
        return directionsButton
    }()
    
    lazy var phoneTextField: NSTextField = {
        let phoneTextField = NSTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        phoneTextField.stringValue = "Phone \n \(annotation.phone)"
        phoneTextField.isEditable = false
        phoneTextField.isBezeled = false
        return phoneTextField
    }()
    
    lazy var addressTextField: NSTextField = {
        let addressTextField = NSTextField()
        addressTextField.stringValue = annotation.address
        addressTextField.isBezeled = false
        addressTextField.isEditable = false
        return addressTextField
    }()
    
    init(annotation: PlaceAnnotation, frame: CGRect = CGRect(x: 0, y: 0, width: 400, height: 400))  {
        self.annotation = annotation
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        let stackView = NSStackView(frame: frame)
        stackView.alignment = .left
        stackView.orientation = .vertical
        stackView.edgeInsets = .init(top: 0, left: 20, bottom: 0, right: 20)
        
        stackView.addArrangedSubview(directionsButton)
        stackView.addArrangedSubview(phoneTextField)
        stackView.addArrangedSubview(addressTextField)
        
        let scrollView = NSScrollView(frame: frame)
        scrollView.hasVerticalScroller = true
        scrollView.documentView = stackView
        
        self.addSubview(scrollView)
    }
    
    
    
}
