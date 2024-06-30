//
//  AllTeamsScreen.swift
//  FormulaOneEpic
//
//  Created by Vedant Mistry on 27/06/24.
//

import UIKit

class AllTeamsScreen: UIViewController {
    //MARK: - View Model for the teams data
    private lazy var allTeamsViewModel = AllTeamsViewModel()
    
    //MARK: - User Interface
    private lazy var allTeamsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)
        
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setupTeamViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Formula 1"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = .white
    }
}

private extension AllTeamsScreen {
    func setupTeamViews() {
        allTeamsTableView.dataSource = self
        
        self.view.addSubview(allTeamsTableView)
        
        NSLayoutConstraint.activate([
            allTeamsTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            allTeamsTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            allTeamsTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            allTeamsTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

//MARK: - User Interface TableView data source
extension AllTeamsScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTeamsViewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = allTeamsViewModel.teams[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        cell.configure(with: team)
        return cell
    }
}
