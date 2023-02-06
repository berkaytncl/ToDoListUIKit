//
//  TodoAddScreen.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import UIKit

final class TodoAddScreen: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var todoAddScreenPresenterObject: ViewToPresenterTodoAddScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TodoAddScreenRouter.createModule(ref: self)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        if let title = titleTextField.text, let description = descriptionTextField.text {
            let date = Date()
            let unixTimestamp = Int(date.timeIntervalSince1970)
            
            todoAddScreenPresenterObject?.save(title: title, description: description, lastChangedTime: unixTimestamp)
        }
    }
}
