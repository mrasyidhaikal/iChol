//
//  FoodInputViewController.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit
import Combine

class FoodInputViewController: UIViewController {
    
    private var mascotImage: UIImageView!
    private var titleLabel: UILabel!
    private var searchBar: UISearchBar!
    private var tableView: UITableView!
        
    var cancelable = Set<AnyCancellable>()
    var timeLabel: String = ""
    
    @Published private var foods: [SearchedFood] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
        setupLayout()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: searchBar.searchTextField)
            .map({ ($0.object as! UISearchTextField).text })
            .debounce(for: .milliseconds(400), scheduler: RunLoop.main)
            .filter({ !$0!.isEmpty })
            .sink { text in
                guard let text = text else { return }
                NetworkService.shared.searchFood(keyword: text) { (result) in
                    switch result {
                    case .success(let foods):
                        self.foods = foods
                    case .failure(let err):
                        self.foods = []
                        print(err.localizedDescription)
                    }
                }
            }
            .store(in: &cancelable)
        
        $foods
            .sink { (_) in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }.store(in: &cancelable)
        
    }
    
    private func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FoodCell.self, forCellReuseIdentifier: FoodCell.reuseIdentifier)
        tableView.backgroundColor = Color.background
        tableView.rowHeight = 140
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
            topAnchor: view.safeAreaLayoutGuide.topAnchor,
            centerXAnchor: view.centerXAnchor,
            heighAnchorConstant: 155, widthAnchorConstant: 135)
        
        mainStack.setConstraint(
            topAnchor: mascotImage.bottomAnchor, topAnchorConstant: 16,
            leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, leadingAnchorConstant: 10,
            trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, trailingAnchorConstant: -10)
        
        tableView.setConstraint(
            topAnchor: mainStack.bottomAnchor, topAnchorConstant: 8,
            bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
            leadingAnchor: view.layoutMarginsGuide.leadingAnchor,
            trailingAnchor: view.layoutMarginsGuide.trailingAnchor)
    }
    
}

extension FoodInputViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodCell.reuseIdentifier, for: indexPath) as! FoodCell
        cell.configureCell(foodName: foods[indexPath.row].name, description: foods[indexPath.row].description)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FoodDetailScreen()
        let food = foods[indexPath.row]
        vc.foodId = food.id
        vc.foodName = food.name
        self.navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
