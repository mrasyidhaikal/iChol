//
//  Screen1ViewController.swift
//  onBoardingDummy
//
//  Created by Muhammad Rasyid khaikal on 09/11/20.
//

import UIKit

class DescriptionScreen4: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let image = UIImage(named: "4")
        
        let imageview:UIImageView = UIImageView()
        imageview.contentMode = UIView.ContentMode.scaleToFill
        imageview.image = image
        view.addSubview(imageview)
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageview.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -100).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 338).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 277).isActive = true
        
        let label1 = UILabel()
        label1.text = "Hello/Good Day"
        label1.font = UIFont.boldSystemFont(ofSize: 25.0)
        
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label1.topAnchor.constraint(equalTo: imageview.bottomAnchor,constant: 20).isActive = true
        
        let label2 = UILabel()
        label2.text = "I'm Picho , a pistachio.And i contain asdas"
        label2.font = UIFont.systemFont(ofSize: 17)
        view.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor,constant: 20).isActive = true
        
        let getStartedBtn = UIButton()
        getStartedBtn.setTitle("Get Started", for: .normal)
        getStartedBtn.layer.cornerRadius =  5
        getStartedBtn.backgroundColor = Color.green
        view.addSubview(getStartedBtn)
        getStartedBtn.translatesAutoresizingMaskIntoConstraints = false
        getStartedBtn.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        getStartedBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        getStartedBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        getStartedBtn.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        getStartedBtn.addTarget(self, action: #selector(handleStarted), for: .touchUpInside)
        
    }
    
    @objc func handleStarted() {
        let pageControl = PageControlForm()
        pageControl.modalPresentationStyle = .fullScreen
        present(pageControl, animated: true, completion: nil)
    }
}
