//
//  ViewController.swift
//  Builder
//
//  Created by Snake on 16.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

//1. Roasted nuts
//    Recipe
//    a. Collect the 100 nuts
//    b. Fry
//    c. Packaging
//
//2. Roasted sunflower seeds
//    a. Collect the 1000 sunflower seeds
//    b. Fry
//    c. Packaging

import UIKit

class ViewController: UIViewController {

    var materialList = [Material]()
    
    @IBAction func mekeNuts(_ sender: UIButton) {
        
        let material = Nuts()
        
        let builder = ConcreteBuilder(material: material)
        let director = Director(builder: builder)
        
        director.constract()
        
        materialList.append(builder.getResult())
        
        update()
        
    }
    
    @IBAction func makeSeeds(_ sender: UIButton) {
        
        let material = Seeds()
        
        let builder = ConcreteBuilder(material: material)
        let director = Director(builder: builder)
        
        director.constract()
        
        materialList.append(builder.getResult())
        
        update()
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    
    func update(){
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: materialList.count - 1, section: 0)], with: .fade)
        tableView.endUpdates()
        
    }
    
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return materialList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MaterialCell")!
        
        cell.textLabel?.text = String(describing: type(of: materialList[indexPath.row]))
        
        cell.detailTextLabel?.text = materialList[indexPath.row].show()
        
        return cell
        
    }
    
    
}

