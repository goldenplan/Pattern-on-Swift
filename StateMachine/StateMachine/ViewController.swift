//
//  ViewController.swift
//  StateMachine
//
//  Created by Snake on 15.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol {
    func changeState(state: State)
    func changeFuelValue(value: Int)
}

class ViewController: UIViewController {


    
    var car = Car()
    
    let stateArray:[State] = [
        ParkingState.sharedInstance,
        FillingState.sharedInstance,
        RidingState.sharedInstance]
    
    var stateImageName: String!{
        didSet{
            UIView.animate(withDuration: 0.1, animations: {
                self.stateImageView.alpha = 0
            }) { (_) in
                
                self.stateImageView.image = UIImage(named: self.stateImageName)
                
                UIView.animate(withDuration: 0.1){
                    self.stateImageView.alpha = 1
                }
            }
        }
    }
    
    @IBAction func nextStateButton(_ sender: Any) {
        
        car.nextState()
        
    }
    
    @IBOutlet weak var stateImageView: UIImageView!
    
    @IBOutlet weak var fuelValueLabel: UILabel!

    @IBOutlet weak var fuelValueSliderLabel: UISlider!
    
    @IBAction func fuelValueSlider(_ sender: UISlider) {
        
        car.fuelValue = Int(sender.value)
        
    }
    
    @IBOutlet weak var stateSegments: UISegmentedControl!
    
    @IBAction func stateSegmentsAction(_ sender: UISegmentedControl) {
        
        car.state = stateArray[sender.selectedSegmentIndex]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegments()
        
        setupCar()
        
    }
    
    func setupCar(){
    
        car.delegate = self
        
        car.state = ParkingState.sharedInstance
        
        car.fuelValue = 20
        
    }

    func setupSegments(){
        
        stateSegments.removeAllSegments()
        
        for state in stateArray{
            stateSegments.insertSegment(withTitle: state.name, at: state.id, animated: true)
        }
        
    }
    
    func deactivateUnavailableState() {
        
        for testState in stateArray{
            if !(car.state.availableState(for: car).contains(where: { (state) -> Bool in
                    return state.name == testState.name
                })) {
            
                stateSegments.setEnabled(false, forSegmentAt: testState.id)
                
                if car.state.name == testState.name {
                    car.state = ParkingState.sharedInstance
                }
            
            }else{
                
                stateSegments.setEnabled(true, forSegmentAt: testState.id)
                
            }
        }
        
    }

}

extension ViewController: ViewControllerProtocol{
    
    func changeState(state: State){
        stateImageName = state.name
        stateSegments.selectedSegmentIndex = car.state.id
        deactivateUnavailableState()
        
    }
    
    func changeFuelValue(value: Int){
        fuelValueLabel.text = String(describing: value)
        fuelValueSliderLabel.setValue(Float(value), animated: true)
        deactivateUnavailableState()
    }
    
}

