import UIKit

class CustomTableViewCell: UITableViewCell {
    let verticalStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let verticalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        let stackViewWidth = stackView.widthAnchor.constraint(equalToConstant: 100)
        stackViewWidth.isActive = true
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // Other UI elements for your cell, like labels, buttons, etc.

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        horizontalStackView.addArrangedSubview(verticalStackView2)
        horizontalStackView.addArrangedSubview(verticalStackView1)

        contentView.addSubview(horizontalStackView)

        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
