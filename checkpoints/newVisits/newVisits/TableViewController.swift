//
//  SecondTableViewController.swift
//  newVisits
//
//  Created by Vedant Mistry on 26/10/23.
//

import UIKit
import MapKit

class TableViewController: UITableViewController {

    let visits = Visits.sampleData
    
    let firstViewController = FirstViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell

        let nameLabel = UILabel()
        nameLabel.text = visits[indexPath.row].name
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        let locationLabel = UILabel()
        locationLabel.text = visits[indexPath.row].location
        locationLabel.textColor = .gray
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        
        cell.verticalStackView1.addArrangedSubview(nameLabel)
        cell.verticalStackView1.addArrangedSubview(locationLabel)
            
        
        let timeOfVisitLabel = UILabel()
        timeOfVisitLabel.text = visits[indexPath.row].timeOfVisit
        timeOfVisitLabel.textColor = .white
        timeOfVisitLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        timeOfVisitLabel.backgroundColor = UIColor(named: "DarkBlue")
        
        let timeSpentLabel = UILabel()
        timeSpentLabel.text = "\(visits[indexPath.row].timeSpent)m"
        timeSpentLabel.textColor = .white
        timeSpentLabel.font = UIFont.systemFont(ofSize: 14)
        
        cell.verticalStackView2.addArrangedSubview(timeOfVisitLabel)
        cell.verticalStackView2.addArrangedSubview(timeSpentLabel)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
