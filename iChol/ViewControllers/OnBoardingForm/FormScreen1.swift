//
//  Form1.swift
//  onBoardingDummy
//
//  Created by Muhammad Rasyid khaikal on 10/11/20.
//

import UIKit

class FormScreen1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let image = UIImage(named: "mascot")
        let imageview = UIImageView()
        imageview.contentMode = UIView.ContentMode.scaleToFill
        imageview.image = image
        view.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageview.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 95).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 115).isActive = true
        
        let label1 = UILabel()
        label1.text = "Hai there, I'm Picho"
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
        
        let label3 = UILabel()
        label3.text = "I'm Picho , a pistachio.And i contain asdas"
        label3.font = UIFont.systemFont(ofSize: 17)
        view.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label3.topAnchor.constraint(equalTo: label2.bottomAnchor,constant: 20).isActive = true
        
        let getStartedBtn = UIButton()
        getStartedBtn.setTitle("Hi Picho", for: .normal)
        getStartedBtn.layer.cornerRadius =  5
        getStartedBtn.backgroundColor = Color.green
        view.addSubview(getStartedBtn)
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        getStartedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getStartedBtn.widthAnchor.constraint(equalToConstant: 270).isActive = true
    }
}
