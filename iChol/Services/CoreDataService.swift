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

    func getDailyIntake(completion: @escaping ([DailyIntake]) -> ()) {
        let fetch = NSFetchRequest<DailyIntake>(entityName: "DailyIntake")
        
        do {
            let result = try moc.fetch(fetch)
            completion(result)
        } catch let err {
            print(err.localizedDescription)
            completion([])
        }
        
    }
    
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
        
        guard let dailyIntake = getCurrentDay(date: date) else { return }
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
    
    func getCurrentDay(date: Date) -> DailyIntake? {
        
        let fetchRequest = NSFetchRequest<DailyIntake>(entityName: "DailyIntake")
        fetchRequest.predicate = NSPredicate(format: "date >= %@ AND date <= %@", date.startOfTheDay() as CVarArg,  date as CVarArg)
        fetchRequest.fetchLimit = 1
        
        do {
            let result = try moc.fetch(fetchRequest)
            return result[0]
        } catch let err {
            print(err.localizedDescription)
        }
        
        return nil
    }
    
    func addFood(foodName: String, date: Date, eatingTime: EatTime) {
        
        guard let today = getCurrentDay(date: date) else { return }
        
        switch eatingTime {
        case .breakfast:
            if today.breakfast == nil {
                let breakfast = Breakfast(context: moc)
                breakfast.food = [foodName]
                today.breakfast = breakfast
            } else {
                today.breakfast?.food?.append(foodName)
            }
        case .lunch:
            if today.lunch == nil {
                let lunch = Lunch(context: moc)
                lunch.food = [foodName]
                today.lunch = lunch
            } else {
                today.lunch?.food?.append(foodName)
            }
        case .dinner:
            if today.dinner == nil {
                let dinner = Dinner(context: moc)
                dinner.food = [foodName]
                today.dinner = dinner
            } else {
                today.dinner?.food?.append(foodName)
            }
        case .snack:
            if today.snack == nil {
                let snack = Snack(context: moc)
                snack.food = [foodName]
                today.snack = snack
            } else {
                today.snack?.food?.append(foodName)
            }
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
