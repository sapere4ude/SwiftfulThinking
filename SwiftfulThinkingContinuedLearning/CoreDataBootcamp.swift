//
//  CoreDataBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Kant on 8/28/24.
//

import SwiftUI
import CoreData

// view - UI
// model - data point
// viewmodel - manages the data for a view

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        // Core Data 핵심 부분
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func updateFruit(entitiy: FruitEntity) {
        let currentName = entitiy.name ?? ""
        let newName = currentName + "!"
        entitiy.name = newName
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}

struct CoreDataBootcamp: View {
    
    @StateObject var vm: CoreDataViewModel = CoreDataViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add Fruit here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "NO NAME")
                            .onTapGesture {
                                vm.updateFruit(entitiy: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(PlainListStyle())
                
                Spacer()
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataBootcamp()
}

