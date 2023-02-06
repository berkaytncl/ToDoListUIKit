//
//  DetailScreen.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import UIKit

final class DetailScreen: UIViewController {

    @IBOutlet weak var lastChangeTimeLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var todo: ToDos?
    
    var detailScreenPresenterObject: ViewToPresenterDetailScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailScreenRouter.createModule(ref: self)
        
        if let todo = todo {
            let lastChangedTime = Date(timeIntervalSince1970: TimeInterval(todo._lastChangedTime))
            
            titleTextField.text = todo._title
            descriptionTextField.text = todo._description
            lastChangeTimeLabel.text = DateManager.shared.getLastModifiedTime(date: lastChangedTime)
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let title = titleTextField.text, let description = descriptionTextField.text, let todoId = todo?._todoId {
            let date = Date()
            let unixTimestamp = Int(date.timeIntervalSince1970)
            
            detailScreenPresenterObject?.update(todoId: todoId, title: title, description: description, lastChangedTime: unixTimestamp)
        }
    }
}
