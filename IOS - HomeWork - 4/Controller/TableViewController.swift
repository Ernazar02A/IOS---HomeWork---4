//
//  ViewController.swift
//  IOS - HomeWork - 4
//
//  Created by MacBook Pro on 21/4/23.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var cards: [Card] = [
        Card(smollImage: "organisers", typeLabel: "Organisers", info: "321 items", bigImage: "org", name: "ELLOVEN", price: "€24.99", roomType: "Home Office", color: "White", material: "Bamboo, Fibreboard", dimensions: "47cm-26cm-10cm", weight: "3kg"),
        Card(smollImage: "readingTable", typeLabel: "Table", info: "121 items", bigImage: "table", name: "IDÅSEN", price: "€229", roomType: "Student room", color: "Brown", material: "Particleboard, Ash veneer", dimensions: "140cmx70cmx75cm", weight: "10kg"),
        Card(smollImage: "shelving", typeLabel: "Shelving", info: "754 items", bigImage: "shelv", name: "", price: "€59.95", roomType: "Living room", color: "White", material: "Particleboard, Fibreboard", dimensions: "77cmx147cm", weight: "12kg"),
        Card(smollImage: "Kitchenware", typeLabel: "Kitchenware", info: "435 items", bigImage: "kichen", name: "", price: "€1.132.54", roomType: "Kitchen", color: "White", material: "Fibreboard, Polyester paint", dimensions: "240cm-60cm-228cm", weight: "120kg"),
        Card(smollImage: "furniture", typeLabel: "Furniture", info: "520 items", bigImage: "furnit", name: "", price: "€1.098", roomType: "Living room", color: "Black", material: "Polyester wadding, Highly", dimensions: "267cm-98cm-68cm", weight: "30kg")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTable()
    }
    
    func updateTable() {
        table.dataSource = self
        table.delegate = self
    }


}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let card = cards[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.tableImage.image = UIImage(named: card.smollImage) 
        cell.titleLabel.text = card.typeLabel
        cell.smollLabel.text = card.info
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
        vc.card = cards[indexPath.row]
    }
    
}
