//
//  ViewController.swift
//  Bridge
//
//  Created by Snake on 24/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layer: UIView!
    
    var figureMaker:FigureMaker = Triangle() {
        didSet{
            show()
        }
    }
    
    var lineStyle:LineStyle = DotDotStyle() {
        didSet{
            show()
        }
    }
    
    
    @IBAction func figureSelector(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            figureMaker = Triangle()
            break
            
        case 1:
            figureMaker = Square()
            break
            
        case 2:
            figureMaker = Pentagon()
            break
            
        default:
            break
            
        }
        
    }
    
    @IBAction func lineSelector(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            lineStyle = DotDotStyle()
            break
            
        case 1:
            lineStyle = DashDotStyle()
            break
            
        case 2:
            lineStyle = SolidStyle()
            break
            
        default:
            break
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        show()
        
    }
    
    func show(){
        Creator.shared.operation(
            view: layer,
            figureMaker: figureMaker,
            lineStyle: lineStyle)
    }


}

