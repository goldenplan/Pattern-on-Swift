//
//  ViewController.swift
//  AstractFactory
//
//  Created by Snake on 14/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let client = Client()
    
    @IBOutlet weak var tableView: UITableView!
    
    var productList = [AbstractProduct]()
    
    @IBAction func pepsiButton(_ sender: UIButton) {
        
        let pepsiFactory = PepsiFactory()
        
        let product = client.make(on: pepsiFactory)
        
        productList.append(product)
        
        _ = product.showProdictComponents()
        
        update()
        
    }
    
    @IBAction func colaButton(_ sender: UIButton) {
        
        let colaFactory = ColaFactory()
        
        let product = client.make(on: colaFactory)
        
        productList.append(product)
        
        _ = product.showProdictComponents()
        
        update()

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    
    func update(){
        
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: productList.count - 1, section: 0)], with: .fade)
        tableView.endUpdates()
        
    }

}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell")!
        
        cell.textLabel?.text = String(describing: type(of: productList[indexPath.row]))
        
        cell.detailTextLabel?.text = productList[indexPath.row].showProdictComponents()
        
        return cell
        
    }
    
    
}


