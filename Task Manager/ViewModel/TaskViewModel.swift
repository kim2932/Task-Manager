//
//  TaskViewModel.swift
//  Task Manager
//
//  Created by 안녕하세요 on 12/26/23.
//

import SwiftUI
import CoreData



class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    
    // Mark New Task Properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
    @Published var showDatePicker: Bool = false
    
    //MARK: Editing Existing Task DATA
    @Published var editTask: Task?
    
    // MARK: Adding Task To Core Data
    func addTask(context: NSManagedObjectContext) -> Bool {
        //MARK: Updating Exisiting Data in core Data
        var task: Task!
        if let editTask = editTask {
            task = editTask
        }else{
            task = Task(context: context)
        }
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // Resetting Data
    func resetTaskData() {
        taskType = "Basic"
        taskColor = "Yellow"
        taskTitle = ""
        taskDeadline = Date()
    }
    
    //MARK: If edit task is avaible then setting exisitng data
    func setupTask(){
        if let editTask = editTask {
            taskType = editTask.type ?? "Basic"
            taskColor = editTask.color ?? "Yellow"
            taskTitle =  editTask.title ?? ""
            taskDeadline = editTask.deadline ?? Date()
        }
    }
}

