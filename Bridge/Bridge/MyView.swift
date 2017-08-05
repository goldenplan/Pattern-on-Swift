//
//  MyView.swift
//  Bridge
//
//  Created by Snake on 24/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class MyView: UIView {

    var points: [CGPoint] = []
    
    var nibName = "MyView"
    
    var view = UIView()
    
    let shapeLayer = CAShapeLayer()
    
    var lineArray: [Int] = []
    
    init(frame: CGRect, points: [CGPoint], lineArray: [Int]) {
        super.init(frame: frame)
        
        self.points = points
        
        self.lineArray = lineArray

        setup(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //если меняются размеры, то вьюха будет себя перерисовывать
        contentMode = .redraw

    }
    
    func setup(frame: CGRect){
        view = loadFromNib()
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
        
        draw(view: view)
        
        
    }
    
    func loadFromNib() -> UIView{
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
        
    }
    
    func draw(view: UIView){
        
        shapeLayer.frame = self.view.frame
        shapeLayer.backgroundColor = UIColor.green.withAlphaComponent(0.7).cgColor
        
        shapeLayer.strokeColor = UIColor.black.withAlphaComponent(0.7).cgColor
        shapeLayer.fillColor = UIColor.magenta.cgColor
        shapeLayer.lineDashPattern = lineArray as [NSNumber]
        shapeLayer.lineWidth = 3
        
        let startPoint = convertedPoint(point: points.first!)
        let endPoint = convertedPoint(point: points.last!)
        
        let path = CGMutablePath()
        path.move(to: startPoint)
        
        for point in points[1...points.count - 1]{
            path.addLine(to: convertedPoint(point: point))
        }
        
        path.addLine(to: endPoint)
        
        path.closeSubpath()
        
        shapeLayer.path = path
        
        let lineDashAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        lineDashAnimation.fromValue = 0
        lineDashAnimation.toValue = shapeLayer.lineDashPattern?.reduce(0) { $0 + $1.intValue }
        lineDashAnimation.duration = 0.5
        lineDashAnimation.repeatCount = Float.greatestFiniteMagnitude
        
        shapeLayer.add(lineDashAnimation, forKey: nil)
        
        view.layer.addSublayer(shapeLayer)

        
    }
    

    func convertedPoint(point: CGPoint) -> CGPoint{
        
        let center = CGPoint(x: bounds.midX,
                             y: bounds.midY)
        
        return CGPoint(x: center.x - point.x,
                       y: center.y - point.y)
        
    }

}
