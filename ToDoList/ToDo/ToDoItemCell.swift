//
//  ToDoItemCell.swift
//  ToDoList
//
//  Created by Илья Черницкий on 17.10.23.
//

import UIKit

final class ToDoItemCell: UITableViewCell {
    static let reuseIdentifier = "ToDoItemCell"

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Kohinoor Bangla", size: 24)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        separatorInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("ToDoItemCell deinit")
    }

    private func setupUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        setConstraints()
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 120),
        ])
    }

    func configure(with toDoItem: UserData) {
        nameLabel.text = toDoItem.toDo
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateString = formatter.string(from: toDoItem.date)
        dateLabel.text = dateString
    }
}
