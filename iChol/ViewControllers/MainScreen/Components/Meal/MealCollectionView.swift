//
//  MealCollectionView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class MealCollectionView: UICollectionView {
    
    let rootView: UIViewController
    
    init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout?, rootView: UIViewController) {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .horizontal
        
        self.rootView = rootView
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(MealCell.self, forCellWithReuseIdentifier: MealCell.reuseIdentifier)
        backgroundColor = Color.background
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MealCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let foodInputVC = FoodInputViewController()
        foodInputVC.timeLabel = EatingTime.eatingTime[indexPath.row]
        rootView.present(UINavigationController(rootViewController: foodInputVC), animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var food: [String] = []
        var calorie = 0
        
        CoreDataService.shared.getDailyIntake { (daily) in
            food = daily.first?.breakfast?.food ?? []
            calorie = Int(daily.first?.breakfast?.total ?? 0)
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MealCell.reuseIdentifier, for: indexPath) as! MealCell
        cell.configureCell(title: EatingTime.eatingTime[indexPath.row],
                           description: food.convertToString(),
                           calories: calorie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200)
    }
    
}

extension Array {
    
    func convertToString() -> String {
        var container: String = ""
        
        self.forEach { (string) in
            container.append("\(string) \n")
        }
        
        return container
    }
    
}
