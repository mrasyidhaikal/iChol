//
//  Form1.swift
//  onBoardingDummy
//
//  Created by Muhammad Rasyid khaikal on 10/11/20.
//

import UIKit

class FormScreen4: UIViewController {
    
    let WeightTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView(){
        view.backgroundColor = .white
        
        let image = UIImage(named: "mascot")
        let imageview:UIImageView = UIImageView()
        imageview.contentMode = UIView.ContentMode.scaleToFill
        imageview.image = image
        view.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageview.topAnchor.constraint(equalTo: view.topAnchor,constant: 20).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 95).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 115).isActive = true
        
        let label1 = UILabel()
        label1.text = "Can you tell us your body posture ?"
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
        
        
        let weightLabel = UILabel()
        weightLabel.setFont(text: "Weight(KG)", size: 16, weight: .bold, color: .black)
        var stackWeight = UIStackView()
        WeightTextField.layer.cornerRadius = 10.0
        WeightTextField.placeholder = "Gender"
        WeightTextField.layer.borderColor = Color.green.cgColor
        WeightTextField.layer.borderWidth = 2.0
        WeightTextField.setConstraint(heighAnchorConstant: 50)
        WeightTextField.addPadding(padding: .equalSpacing(10))
        
        stackWeight = UIStackView(arrangedSubviews: [weightLabel, WeightTextField])
        stackWeight.axis = .vertical
        stackWeight.spacing = 16
        
        view.addSubview(stackWeight)
        stackWeight.setConstraint(topAnchor: label2.bottomAnchor,topAnchorConstant: 50,centerXAnchor: view.centerXAnchor, widthAnchorConstant: 299)
        
        
        let heightLabel = UILabel()
        heightLabel.setFont(text: "Height(CM)", size: 16, weight: .bold, color: .black)
        
        var stackHeight = UIStackView()
        let HeightTextField = UITextField()
        HeightTextField.addPadding(padding: .equalSpacing(10))
        HeightTextField.layer.cornerRadius = 10.0
        HeightTextField.layer.borderColor = Color.green.cgColor
        HeightTextField.layer.borderWidth = 2.0
        HeightTextField.placeholder = "Age"
        HeightTextField.setConstraint(heighAnchorConstant: 50)
        stackHeight = UIStackView(arrangedSubviews: [heightLabel, HeightTextField])
        stackHeight.axis = .vertical
        stackHeight.spacing = 16
        view.addSubview(stackHeight)
        
        stackHeight.setConstraint(topAnchor: stackWeight.bottomAnchor,topAnchorConstant: 50,centerXAnchor: view.centerXAnchor, widthAnchorConstant: 299)
        
        let getStartedBtn = UIButton()
        getStartedBtn.setTitle("Hi Picho", for: .normal)
        getStartedBtn.layer.cornerRadius =  5
        getStartedBtn.backgroundColor = Color.green
        view.addSubview(getStartedBtn)
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        getStartedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getStartedBtn.widthAnchor.constraint(equalToConstant: 270).isActive = true
    }
}


