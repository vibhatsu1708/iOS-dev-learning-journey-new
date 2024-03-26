//
//  CoreDataRelationshipsLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 26/03/24.
//

import SwiftUI
import CoreData

class CoreDataManager {
    // singleton instance
    static let instance = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataContainer")
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error loading Core Data: \(error)")
            }
        }
        context = container.viewContext
    }
    
    func saveData() {
        do {
            try context.save()
            print("Saved successfully!")
        } catch let error {
            print("Error: \(error)")
        }
    }
}

class CoreDataRelationshipsViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var businesses: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Meta"
//        newBusiness.departments = [departments[0], departments[1]]
//        newBusiness.employees = [employees[0], employees[1], employees[5]]

        save()
    }
    
    func addDepartment() {
        let newDepartment = DepartmentEntity(context: manager.context)
        newDepartment.name = "AR/VR department"
        newDepartment.businesses = [businesses[0], businesses[2], businesses[3]]
        newDepartment.addToEmployees(employees[3])
        
        
        save()
    }
    
    func addEmployee() {
        let newEmployee = EmployeeEntity(context: manager.context)
        
        newEmployee.age = 24
        newEmployee.dateJoined = Date()
        newEmployee.name = "Bruce Banner"
        
        newEmployee.department = departments[1]
        
        save()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Error while fetching: \(error)")
        }
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Error while fetching: \(error)")
        }
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Error while fetching: \(error)")
        }
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.manager.saveData()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
    }
}

struct CoreDataRelationshipsLearning: View {
    @StateObject var viewModel = CoreDataRelationshipsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Button {
                        viewModel.addDepartment()
                    } label: {
                        Text("Perform action")
                            .foregroundStyle(Color.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    }
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(viewModel.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(viewModel.departments) { department in
                                DepartmentView(entity: department)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top) {
                            ForEach(viewModel.employees) { employee in
                                EmployeeView(entity: employee)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .padding()
            .navigationTitle("Relationships")
        }
    }
}

struct BusinessView: View {
    let entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "no entity name")")
                .bold()
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "no department name")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "no employee name")
                }
            }
        }
        .padding()
        .background(Color.secondary.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 10)
    }
}

struct DepartmentView: View {
    let entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "no entity name")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Businesses")
                    .bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "no business name")
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employees")
                    .bold()
                ForEach(employees) { employee in
                    Text(employee.name ?? "no employee name")
                }
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 10)
    }
}

struct EmployeeView: View {
    let entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "no entity name")")
                .bold()
            
            Text("Age: \(entity.age)")
            
            Text("Date joined: \(entity.dateJoined)")
            
            Text("Business")
                .bold()
            Text(entity.business?.name ?? "no business name")
            
            Text("Department")
                .bold()
            Text(entity.department?.name ?? "no department name")
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 10)
    }
}

#Preview {
    CoreDataRelationshipsLearning()
}
