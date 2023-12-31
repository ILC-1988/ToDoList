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
    let backgroundColor = #colorLiteral(red: 0.7090554476, green: 0.6616386168, blue: 1, alpha: 1)
    let cornerRadius = 10
    lazy var viewContainer = UIView()
    lazy var textField = UITextField()
    lazy var button = UIButton()

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
        view.addSubview(viewContainer)
        view.backgroundColor = backgroundColor
        viewContainer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        textField.delegate = self
        textField.placeholder = Resources.Strings.Main.Add
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.layer.cornerRadius = CGFloat(cornerRadius)
        viewContainer.addSubview(textField)

        button.setTitle(Resources.Strings.Main.AddButton, for: .normal)
        button.layer.cornerRadius = CGFloat(cornerRadius)
        button.backgroundColor = backgroundColor
        let coller = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.setTitleColor(coller, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        viewContainer.addSubview(button)

        tableView.reloadData()
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
        tableView.separatorColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tableView.separatorStyle = .singleLine
        tableView.layer.cornerRadius = CGFloat(cornerRadius)
        tableView.register(ToDoItemCell.self, forCellReuseIdentifier: "ToDoItemCell")
        viewContainer.addSubview(tableView)
    }

    private func setConstraints() {
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            viewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4),

            textField.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 4),
            textField.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 4),
            textField.heightAnchor.constraint(equalToConstant: 40),

            button.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 4),
            button.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 4),
            button.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -4),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 100),

            tableView.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4),
            tableView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 4),
            tableView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -4),
            tableView.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -4)
        ])
    }
    
    @objc
    func buttonTapped() {
        addItemToTableView()
        textField.text = nil
        textField.resignFirstResponder()
    }
}
