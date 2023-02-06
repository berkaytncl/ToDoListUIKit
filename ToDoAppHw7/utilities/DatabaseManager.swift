//
//  DatabaseManager.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import Foundation

final class DatabaseManager {
    static let shared = DatabaseManager()
    let db: FMDatabase?
    
    private init() {
        let bundlePath = Bundle.main.path(forResource: "todos", ofType: ".sqlite")
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let dbURL = URL(fileURLWithPath: destinationPath).appendingPathComponent("todos.sqlite")
        
        db = FMDatabase(path: dbURL.path)
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: dbURL.path) {
            print("Database already have")
        } else {
            do {
                try fm.copyItem(atPath: bundlePath!, toPath: dbURL.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func uploadTodos() -> [ToDos] {
        var todoList = [ToDos]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM todos", values: nil)
            
            while rs.next() {
                let todoId = Int(rs.string(forColumn: "todo_id"))!
                let title = rs.string(forColumn: "title")!
                let description = rs.string(forColumn: "description")!
                let lastChangedTime = Int(rs.string(forColumn: "last_changed_time"))!
                
                let todo = ToDos(todoId: todoId, title: title, description: description, lastChangedTime: lastChangedTime)
                todoList.append(todo)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
        return todoList
    }
    
    func search(searchWord: String) -> [ToDos] {
        var todoList = [ToDos]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM todos WHERE title like ?", values: ["%\(searchWord)%"])
            
            while rs.next() {
                let todoId = Int(rs.string(forColumn: "todo_id"))!
                let title = rs.string(forColumn: "title")!
                let description = rs.string(forColumn: "description")!
                let lastChangedTime = Int(rs.string(forColumn: "last_changed_time"))!
                
                let todo = ToDos(todoId: todoId, title: title, description: description, lastChangedTime: lastChangedTime)
                todoList.append(todo)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
        return todoList
    }
    
    func delete(todoId: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM todos WHERE todo_id = ?", values: [todoId])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func update(todoId: Int, title: String, description: String, lastChangedTime: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE todos SET title = ? , description = ? , last_changed_time = ? WHERE todo_id = ?", values: [title,description,lastChangedTime,todoId])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func save(title: String, description: String, lastChangedTime: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO todos (title,description,last_changed_time) VALUES (?,?,?)", values: [title, description, lastChangedTime])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
