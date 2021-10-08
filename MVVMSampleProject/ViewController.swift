//
//  ViewController.swift
//  MVVMSampleProject
//
//  Created by MAC on 08/10/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var itemsTableView: UITableView!
    
    let items = [
        Person(name: "ali", age: 20, height: 7.5, gender: "male"),
        Person(name: "ahmad", age: 25, height: 7.9, gender: "male"),
        Person(name: "sara", age: 18, height: 5.5, gender: "female")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsTableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier) as! CustomTableViewCell
        
        let model = items[indexPath.row]
        let viewModel = CellViewModel(name: model.name, gender: model.gender)
        cell.nameLabel.text = "\(viewModel.name)'s gender is \(viewModel.gender)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

struct Person {
    let name: String
    let age: Int
    let height: Double
    let gender: String
}

struct CellViewModel {
    let name: String
    let gender: String
}
