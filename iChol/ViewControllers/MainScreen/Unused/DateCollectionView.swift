//
//  DateCollectionView.swift
//  iChol
//
//  Created by Windy on 02/11/20.
//

import UIKit

class DateCollectionView: UICollectionView {
    
    private var dayLabel: [String] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        register(DayCell.self, forCellWithReuseIdentifier: DayCell.reuseIdentifier)
        
        delegate = self
        dataSource = self
        
        dayLabel = Calendar.current.shortWeekdaySymbols
        
        backgroundColor = Color.background
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DateCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.reuseIdentifier, for: indexPath) as! DayCell
        cell.dayLabel.text = dayLabel[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 64)
    }
    
}
