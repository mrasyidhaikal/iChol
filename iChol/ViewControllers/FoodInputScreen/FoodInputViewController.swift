//
//  FoodInputViewController.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class FoodInputViewController: UIViewController {
    
    private var mascotImage: UIImageView!
    private var titleLabel: UILabel!
    private var searchBar: UISearchBar!
    private var tableView: UITableView!
    
    var timeLabel: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupView()
        setupTableView()
        setupLayout()
        
        view.backgroundColor = Color.background
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FoodCell.self, forCellReuseIdentifier: FoodCell.reuseIdentifier)
        tableView.backgroundColor = Color.background
        tableView.rowHeight = 132
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
    }

    
    private func setupView() {
        view.backgroundColor = Color.background
        
        mascotImage = UIImageView()
        mascotImage.image = UIImage(named: "mascot")
        mascotImage.contentMode = .scaleAspectFit
        view.addSubview(mascotImage)
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        titleLabel.text = "Would you mind to share your \n\(timeLabel) with me?"
        
        searchBar = UISearchBar()
        searchBar.placeholder = "Enter your food"
        searchBar.searchBarStyle = .minimal
    }
    
    private func setupLayout() {
        let mainStack = UIStackView(arrangedSubviews: [titleLabel, searchBar])
        mainStack.axis = .vertical
        mainStack.spacing = 16
        view.addSubview(mainStack)
        
        mascotImage.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor, topAnchorConstant: 32,
            centerXAnchor: view.centerXAnchor,
            heighAnchorConstant: 155, widthAnchorConstant: 135)
        
        mainStack.setConstraint(
            topAnchor: mascotImage.bottomAnchor, topAnchorConstant: 16,
            leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, leadingAnchorConstant: 10,
            trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, trailingAnchorConstant: -10)
        
        tableView.setConstraint(
            topAnchor: mainStack.bottomAnchor,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
    }
    
    private func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(handleAdd))
    }
    
    @objc private func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func handleAdd() {
        /// Do something when tap Add
        dismiss(animated: true, completion: nil)
    }
    
}

extension FoodInputViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodCell.reuseIdentifier, for: indexPath) as! FoodCell
        cell.configureCell(foodName: "Nasi Lemak", calorie: Int.random(in: 100...500))
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(FoodDetailScreen(), animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            /// Delete
        }
    }
    
}
