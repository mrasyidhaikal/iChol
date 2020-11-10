//
//  Form1.swift
//  onBoardingDummy
//
//  Created by Muhammad Rasyid khaikal on 10/11/20.
//

import UIKit

class FormScreen3: UIViewController {
    
    var gender = ["Male","Female"]
    let genderTextField = UITextField()
    let pickerView = UIPickerView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        pickGender()
        setupView()
        
    }
    
    func pickGender(){
        pickerView.delegate?.pickerView?(pickerView, didSelectRow: 0, inComponent: 0)
        pickerView.delegate = self
        pickerView.dataSource = self
        genderTextField.inputView = pickerView
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
        imageview.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 95).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 115).isActive = true
        
        let label1 = UILabel()
        label1.text = "I Want to know more about you."
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
        
        genderTextField.layer.cornerRadius = 10.0
        genderTextField.placeholder = "Gender"
        genderTextField.layer.borderColor = UIColor.green.cgColor
        genderTextField.layer.borderWidth = 2.0
        genderTextField.addPadding(padding: .equalSpacing(10))
        view.addSubview(genderTextField)
        genderTextField.setConstraint(topAnchor: label2.bottomAnchor,topAnchorConstant: 50,centerXAnchor: view.centerXAnchor,heighAnchorConstant: 50, widthAnchorConstant: 299)
        
        let ageTextField = UITextField()
        ageTextField.addPadding(padding: .equalSpacing(10)) 
        ageTextField.layer.cornerRadius = 10.0
        ageTextField.layer.borderColor = UIColor.green.cgColor
        ageTextField.layer.borderWidth = 2.0
        ageTextField.placeholder = "Age"
        view.addSubview(ageTextField)
        ageTextField.setConstraint(topAnchor: genderTextField.bottomAnchor,topAnchorConstant: 50,centerXAnchor: view.centerXAnchor,heighAnchorConstant: 50, widthAnchorConstant: 299)
        
        let getStartedBtn = UIButton()
        getStartedBtn.setTitle("Hi Picho", for: .normal)
        getStartedBtn.layer.cornerRadius =  5
        getStartedBtn.backgroundColor = .green
        view.addSubview(getStartedBtn)
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        getStartedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getStartedBtn.widthAnchor.constraint(equalToConstant: 270).isActive = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension FormScreen3 :  UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    public func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    public func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60.0
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = gender[row]
    }
    
}

