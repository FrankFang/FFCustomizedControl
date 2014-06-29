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
        // Initialization code here.
    }
    init(coder: NSCoder!){
        super.init(coder: coder)
    }

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
    func setUpValue(){
        self.enabled = true
        self.setUpLayers()
    }
    
    func setUpLayers(){
        var rootLayer = CALayer()
        
        self.layer = rootLayer
        self.wantsLayer = true
        
        var bgLayer = CALayer()
        bgLayer.autoresizingMask = CAAutoresizingMask.LayerWidthSizable | CAAutoresizingMask.LayerHeightSizable
        bgLayer.bounds = rootLayer.bounds
        bgLayer.anchorPoint = CGPoint(x:0,y:0)
        
    }
    
}
