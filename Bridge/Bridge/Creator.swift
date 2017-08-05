//
//  AbstructCrator.swift
//  Bridge
//
//  Created by Snake on 24/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class Creator: NSObject {

    var view: UIView!
    
    var figureMaker: FigureMaker!
    
    var lineStyle: LineStyle!
    
    var subView: UIView? = nil
    
    static var shared:Creator = {
        let instance = Creator()
        return instance
    }()
    
    
    public func operation(view: UIView, figureMaker: FigureMaker, lineStyle: LineStyle){
        
        self.view = view
        
        self.figureMaker = figureMaker
        
        self.lineStyle = lineStyle
        
        
        if subView != nil{
            subView?.removeFromSuperview()
        }
        
        let figureView = MyView(
            frame: view.bounds,
            points: figureMaker.getPointsForFigure(),
            lineArray: lineStyle.get())
        
        subView = figureView
        
        view.addSubview(subView!)
        

    }
    
}
