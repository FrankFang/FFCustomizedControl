//
//  FFSwitch.swift
//  FFCustomizedControl
//
//  Created by FrankFang on 14-6-11.
//  Copyright (c) 2014年 FrankFang. All rights reserved.
//

import Cocoa
import QuartzCore

class FFSwitch: NSControl {
    

    init(frame: NSRect) {
        super.init(frame: frame)
        self.setUp()
        // Initialization code here.
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    func setUpValue(){
        self.enabled = true
        self.setUpLayers()
    }
    
    var bg = CALayer()
    var knob = CALayer()
    var knobBgColor = NSColor(calibratedWhite:1.0,alpha:1.0)
    var inner = CALayer()
    
    func setUpLayers(){
        var rootLayer = CALayer()
        
        self.layer = rootLayer
        self.wantsLayer = true
        
        // add background
        
        bg.autoresizingMask = CAAutoresizingMask.LayerWidthSizable | CAAutoresizingMask.LayerHeightSizable
        bg.bounds = rootLayer.bounds
        bg.anchorPoint = CGPoint(x:0,y:0)
        bg.borderWidth = 1.0
        rootLayer.addSublayer(bg)
        
        // add knob
        knob.frame = self.getKnobRect()
        knob.autoresizingMask = CAAutoresizingMask.LayerHeightSizable
        knob.backgroundColor = knobBgColor.CGColor
        knob.shadowColor = NSColor.blackColor().CGColor
        knob.shadowOffset = CGSize(width:0.0,height:-2.0)
        knob.shadowRadius = 1.0
        knob.shadowOpacity = 0.3
        rootLayer.addSublayer(knob)
        
        inner.frame = knob.bounds
        inner.autoresizingMask = CAAutoresizingMask.LayerWidthSizable | CAAutoresizingMask.LayerHeightSizable
        inner.shadowColor = NSColor.blackColor().CGColor
        inner.shadowOffset = CGSize(width: 0.0, height: 0.0)
        inner.backgroundColor = NSColor.whiteColor().CGColor
        inner.shadowRadius = 1.0
        inner.shadowOpacity = 0.35
        knob.addSublayer(inner)
        
        self.reloadLayerSize()
        
        
    }
    
    func setUp(){
        self.enabled = true
        setUpLayers()
    }
    
    var isActive = false
    var ratio = 1.0
    var bRatio = 1.0
    
    func getKnobRect() -> CGRect{
        var height = bg.bounds.size.height - 2 * 1
        var width = bg.bounds.size.width - 2 * 1
        var x = 1.0
        var y = 1.0
        var rect = CGRect()
        rect.size.width = width
        rect.size.height = height
        rect.origin.x = x
        rect.origin.y = y
        return rect
    }
    
    func reloadLayerSize() {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        bg.cornerRadius = bg.bounds.size.height / 2
        knob.cornerRadius = knob.bounds.size.height / 2
        inner.cornerRadius = knob.bounds.size.height / 2
        CATransaction.commit()
    }
    
    func reloadLayer(){
    }
    
    
    
    
}

