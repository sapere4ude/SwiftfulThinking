//
//  CoreDataRelationshipsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kant on 8/29/24.
//

import SwiftUI
import CoreData

// 3 entities
// BusinessEntity
// DepartmentEntity
// EmployeeEntity

class CoreDataManager {
    
    static let instance = CoreDataManager() // Singleton
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}

class CoreDataRelationshipViewModel: ObservableObject {
    let manager = CoreDataManager.instance
}

struct CoreDataRelationshipsBootcamp: View {
    
    @StateObject var vm = CoreDataRelationshipViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CoreDataRelationshipsBootcamp()
}
