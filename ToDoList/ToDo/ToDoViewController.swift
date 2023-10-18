//
//  ViewController.swift
//  ToDoList
//
//  Created by Илья Черницкий on 16.10.23.
//

import UIKit

final class ToDoViewController: UIViewController, UISearchBarDelegate {

    lazy var tableView = UITableView()
    var viewModel = ToDoViewModel()
    lazy var viewCont = UIView()
    lazy var textField = UITextField()

    init(viewModel: ToDoViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("ToDoViewController deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.fetchToDoItems()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setConstraints()
    }

    func setupUI() {
        view.addSubview(viewCont)
        view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        viewCont.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)

        textField.delegate = self
        textField.placeholder = "Add new to do"
        textField.font = UIFont.boldSystemFont(ofSize: 24)
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        viewCont.addSubview(textField)

        tableView.reloadData()
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        tableView.separatorColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
        viewCont.addSubview(tableView)
    }

    private func setConstraints() {
        viewCont.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            viewCont.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewCont.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewCont.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewCont.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4),

            textField.topAnchor.constraint(equalTo: viewCont.topAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: viewCont.leadingAnchor, constant: 4),
            textField.trailingAnchor.constraint(equalTo: viewCont.trailingAnchor, constant: -4),
            textField.heightAnchor.constraint(equalToConstant: 40),

            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            tableView.leadingAnchor.constraint(equalTo: viewCont.leadingAnchor, constant: 4),
            tableView.trailingAnchor.constraint(equalTo: viewCont.trailingAnchor, constant: -4),
            tableView.bottomAnchor.constraint(equalTo: viewCont.bottomAnchor, constant: -4)
        ])
    }
}
