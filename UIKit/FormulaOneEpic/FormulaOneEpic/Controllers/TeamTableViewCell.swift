//
//  TeamTableViewCell.swift
//  FormulaOneEpic
//
//  Created by Vedant Mistry on 28/06/24.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    static let cellId = "TeamTableViewCell"
    
    //MARK: - User Interface
    // for all the container parent view that houses all the content and which has the rounded radius.
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // for the stack view of the content, housing all the content.
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    // for the image view displaying the team logo.
    private lazy var teamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    // for the name label
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    // for the titles won label
    private lazy var titlesWonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    // for the team principal label
    private lazy var teamPrincipalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    // for the team's drivers label
    private lazy var driversLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    // for the team description label
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 0
        
        return label
    }()
    
    //MARK: - Life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 15.0
    }
    
    func configure(with team: Team) {
        containerView.backgroundColor = team.id.teamBackgroundColor
        
        teamImageView.image = team.id.teamLogo
        
        nameLabel.text = team.name
        titlesWonLabel.text = "\(team.worldTitlesWon)"
        teamPrincipalLabel.text = "Team Principal: \(team.teamPrincipal)"
        driversLabel.text = "Current Drivers: \(team.drivers.joined(separator: ", "))"
        descriptionLabel.text = "Team Description: \(team.description)"
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(teamImageView)
        containerView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(titlesWonLabel)
        contentStackView.addArrangedSubview(teamPrincipalLabel)
        contentStackView.addArrangedSubview(driversLabel)
        contentStackView.addArrangedSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            teamImageView.heightAnchor.constraint(equalToConstant: 50),
            teamImageView.widthAnchor.constraint(equalToConstant: 50),
            teamImageView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            teamImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: teamImageView.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
        ])
    }
}
