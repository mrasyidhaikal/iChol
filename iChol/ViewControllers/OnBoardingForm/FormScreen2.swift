//
//  Form1.swift
//  onBoardingDummy
//
//  Created by Muhammad Rasyid khaikal on 10/11/20.
//

import UIKit

class FormScreen2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let image = UIImage(named: "mascot")
        let imageview:UIImageView = UIImageView()
        imageview.contentMode = UIView.ContentMode.scaleToFill
        imageview.image = image
        view.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageview.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 95).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 115).isActive = true
        
        let label1 = UILabel()
        label1.text = "Can you tell us your name?"
        label1.font = UIFont.boldSystemFont(ofSize: 25.0)
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: imageview.bottomAnchor,constant: 20).isActive = true
        
        let label2 = UILabel()
        label2.text = "I will help you to start your new eating healthy habit"
        label2.font = UIFont.systemFont(ofSize: 17)
        view.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor,constant: 20).isActive = true
        
        let nameTextField = UITextField()
        nameTextField.layer.cornerRadius = 10.0
        nameTextField.layer.borderColor = UIColor.green.cgColor
        nameTextField.layer.borderWidth = 2.0
        nameTextField.addPadding(padding: .equalSpacing(10))
        nameTextField.placeholder = "Your Name"
        view.addSubview(nameTextField)
        nameTextField.setConstraint(topAnchor: label2.bottomAnchor,topAnchorConstant: 50,centerXAnchor: view.centerXAnchor,heighAnchorConstant: 50, widthAnchorConstant: 299)
        
        let getStartedBtn = UIButton()
        getStartedBtn.setTitle("Hi Picho", for: .normal)
        getStartedBtn.layer.cornerRadius =  5
        getStartedBtn.backgroundColor = .green
        view.addSubview(getStartedBtn)
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        getStartedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getStartedBtn.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
    }
}
