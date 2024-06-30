//
//  CarListVC.swift
//  LearningTableView
//
//  Created by Vedant Mistry on 30/06/24.
//

import UIKit

struct Cells {
    static let carCell = "CarCell"
}

class CarListVC: UIViewController {
    var tableView = UITableView()
    
    var carsFetched: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Garage"
        carsFetched = DummyData().fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegate()
        tableView.rowHeight = 120
        tableView.register(CarCell.self, forCellReuseIdentifier: Cells.carCell)
        tableView.pin(to: view)
        
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CarListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsFetched.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.carCell) as! CarCell
        let car = carsFetched[indexPath.row]
        cell.set(car: car)
        
        return cell
    }
}
