//
//  HomeScreen.swift
//  ToDoAppHw7
//
//  Created by Berkay Tuncel on 2.02.2023.
//

import UIKit

final class HomeScreen: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var todoList = [ToDos]()
    
    var homeScreenPresenterObject: ViewToPresenterHomeScreenProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeScreenRouter.createModule(ref: self)
        
        configureSearchBar()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeScreenPresenterObject?.uploadTodos()
    }
}

extension HomeScreen: PresenterToViewHomeScreenProtocol {
    func dataSendToView(todoList: [ToDos]) {
        self.todoList = todoList
        self.tableView.reloadData()
    }
}

extension HomeScreen: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homeScreenPresenterObject?.search(searchWord: searchText)
    }
}

extension HomeScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoTableViewCell") as? TableViewCell
        guard let cell = cell else { return UITableViewCell() }
        
        cell.isFirstIndex = indexPath.row == 0 ? true : false
        cell.isLastIndex = indexPath.row == todoList.count - 1 ? true : false
        
        let todo = todoList[indexPath.row]
        
        let lastChangedTime = Date(timeIntervalSince1970: TimeInterval(todo._lastChangedTime))
        
        cell.titleLable.text = todo._title
        cell.descriptionLabel.text = todo._description
        cell.lastChangedTimeLabel.text = DateManager.shared.getLastModifiedTime(date: lastChangedTime)
        
        cell.backgroundColor = UIColor().generateRandomColor()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetailScreen", sender: todo)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, bool) in
            let todo = self.todoList[indexPath.row]

            let alert = UIAlertController(title: "Deletion Process", message: "\(todo._title) delete?", preferredStyle: .alert)

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)

            let okeyAction = UIAlertAction(title: "Okey", style: .destructive) { action in
                self.homeScreenPresenterObject?.delete(todoId: todo._todoId)
            }
            alert.addAction(okeyAction)

            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension HomeScreen {
    func configureSearchBar() {
        searchBar.delegate = self
    }
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailScreen" {
            if let todo = sender as? ToDos {
                let destinationVC = segue.destination as! DetailScreen
                destinationVC.todo = todo
            }
        }
    }
}
