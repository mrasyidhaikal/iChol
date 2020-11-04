//
//  CoreDataService.swift
//  iChol
//
//  Created by Windy on 04/11/20.
//

import CoreData
import UIKit

class CoreDataService {
    
    static let shared = CoreDataService()
    
    private let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func createDailyIntake(id: UUID, fat: Double, calories: Int, sugar: Double, date: Date) {
        
        let dailyIntake = DailyIntake(context: moc)
        dailyIntake.id = id
        dailyIntake.saturatedFat = fat
        dailyIntake.totalCalories = Int64(calories)
        dailyIntake.sugar = sugar
        dailyIntake.date = date
        
        do {
            try moc.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func updateDailyIntake(fat: Double, calories: Int, sugar: Double, date: Date) {
        
        let dailyIntake = getCurrentDay(date: date)
        dailyIntake?.saturatedFat = fat
        dailyIntake?.totalCalories = Int64(calories)
        dailyIntake?.sugar = sugar
        dailyIntake?.date = date
        
        do {
            try moc.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
    func getCurrentDay(date: Date) -> DailyIntake? {
        
        let fetchRequest = NSFetchRequest<DailyIntake>(entityName: "DailyIntake")
        fetchRequest.predicate = NSPredicate(format: "date >= %@ date <= %@", date.startOfTheDay() as CVarArg,  date as CVarArg)
        
        do {
            let result = try moc.fetch(fetchRequest)
            return result[0]
        } catch let err {
            print(err.localizedDescription)
        }
        
        return nil
    }
    
    func addFood(foodName: String, date: Date, eatingTime: EatTime) {
        
        let today = getCurrentDay(date: date)
                
        switch eatingTime {
        case .breakfast:
            let breakfast = today?.breakfast
            breakfast?.food?.append(foodName)
        case .lunch:
            let lunch = today?.lunch
            lunch?.food?.append(foodName)
        case .dinner:
            let dinner = today?.dinner
            dinner?.food?.append(foodName)
        case .snack:
            let snack = today?.snack
            snack?.food?.append(foodName)
        }
        
        do {
            try moc.save()
        } catch let err {
            print(err.localizedDescription)
        }
    }
    
//    func deleteHabit(id: UUID) {
//        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<Habit>(entityName: HabitConstant.entityName)
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
//
//        do {
//            let result = try moc.fetch(fetchRequest)
//            let dataToDelete = result[0]
//
//            moc.delete(dataToDelete)
//
//            try moc.save()
//        } catch let err {
//            print(err.localizedDescription)
//        }
//    }
    
}

