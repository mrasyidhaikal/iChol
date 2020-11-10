//
//  ProfileViewController.swift
//  iChol
//
//  Created by Windy on 07/11/20.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var imageProfile: UIImageView!
    private var editButton: UIButton!
    private var tableView: UITableView!
    
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        imageProfile = UIImageView()
        imageProfile.image = UIImage(named: viewModel.imageProfile)
        imageProfile.layer.borderWidth = 5
        imageProfile.layer.borderColor = Color.green.cgColor
        view.addSubview(imageProfile)
        
        imageProfile.setConstraint(
            topAnchor: view.safeAreaLayoutGuide.topAnchor, topAnchorConstant: 32,
            centerXAnchor: view.centerXAnchor,
            heighAnchorConstant: 110, widthAnchorConstant: 110)
        
        editButton = UIButton()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        tableView.setConstraint(
            topAnchor: safeArea.topAnchor, topAnchorConstant: 0,
            bottomAnchor: safeArea.bottomAnchor, bottomAnchorConstant: 0,
            leadingAnchor: safeArea.leadingAnchor, leadingAnchorConstant: 0,
            trailingAnchor: safeArea.trailingAnchor, trailingAnchorConstant: 0)
    }
    
    @objc private func handleSwitch(sender: UISwitch) {
        viewModel.handleSwitch(value: sender.isOn)
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.reuseIdentifier) as! ProfileCell
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = viewModel.fullName[indexPath.row]
        case 1:
            cell.textLabel?.text = viewModel.secondSectionLabel[indexPath.row]
        case 2:
            cell.textLabel?.text = viewModel.thirdSectionLabel[indexPath.row]
            if indexPath.row == 0 {
                let control = UISwitch()
                control.isOn = viewModel.isSync
                control.addTarget(self, action: #selector(handleSwitch(sender:)), for: .valueChanged)
                cell.accessoryView = control
            } else {
                cell.accessoryType = .disclosureIndicator
            }
        default:
            break
        }
        
        return cell
    }
     
}

