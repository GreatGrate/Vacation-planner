//
//  CoreDataHelper.swift
//  Vacation Planner
//
//  Created by Mouse food on 7/18/18.
//  Copyright © 2018 Mouse food. All rights reserved.
//

import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func saveContent() {
        do {
            try context.save()
            print("saving")
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func newContent() -> PlannerTextViewEntity {
        let newPlannerTextViewEntity = NSEntityDescription.insertNewObject(forEntityName: "PlannerTextViewEntity", into: context) as! PlannerTextViewEntity
        return newPlannerTextViewEntity
    }
    
    static func loadContent() -> PlannerTextViewEntity? {
        do {
            let fetchRequest = NSFetchRequest<PlannerTextViewEntity>(entityName: "PlannerTextViewEntity")
            let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "PlannerTextViewEntity")
            let results = try context.fetch(fetchRequest).last
            if results != nil {
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetch)
                _ = try context.execute(deleteRequest)
                let newContent = CoreDataHelper.newContent()
                newContent.content = results!.content
                CoreDataHelper.saveContent()
            }
            guard let resultsToReturn = results else {return nil}
            return resultsToReturn
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            return nil
        }
    }
}
