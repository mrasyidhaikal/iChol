//
//  ProfileViewModel.swift
//  iChol
//
//  Created by Windy on 08/11/20.
//

import Foundation

class ProfileViewModel {
    
    var fullName: [String] = []
    var secondSection: [String] = []
    var isSync: Bool = false
    
    let secondSectionLabel = ["Gender", "Age", "Height", "Weight"]
    let thirdSectionLabel = ["Sync to HealthKit", "Notifications"]
    
    init() {
        fetchUserDefault()
    }
    
    func handleSwitch(value: Bool) {
        isSync.toggle()
    }
    
    private func fetchUserDefault() {
        fullName = [
            UserDefaultService.firstName,
            UserDefaultService.lastName]
        
        secondSection = [
            UserDefaultService.gender,
            UserDefaultService.age,
            UserDefaultService.height,
            UserDefaultService.weight
        ]
        
        isSync = UserDefaultService.isSyncHealthKit
    }
    
}
