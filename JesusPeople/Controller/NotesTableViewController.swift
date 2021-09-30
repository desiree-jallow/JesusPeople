//
//  NotesTableViewController.swift
//  JesusPeople
//
//  Created by Desiree on 6/24/21.
//

import UIKit
import RealmSwift


class NotesTableViewController: UITableViewController {
    let realm = try! Realm()
    var notificationToken: NotificationToken?
    var selectedNote: Note?
    
    @IBOutlet weak var startLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = tabBarController?.tabBar.selectedItem?.title
       observeChanges()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observeChanges()
    }
    
    func observeChanges() {
        let notesArray = realm.objects(Note.self)
        
        notificationToken = notesArray.observe { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            switch changes {
            case .initial:
                // Results are now populated and can be accessed without blocking the UI
                self?.showStartLabel()
                tableView.reloadData()
                
            case .update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the UITableView
                tableView.performBatchUpdates({
                    // Always apply updates in the following order: deletions, insertions, then modifications.
                    // Handling insertions before deletions may result in unexpected behavior.
                    tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}),
                                         with: .automatic)
                    tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0) }),
                                         with: .automatic)
                    tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0) }),
                                         with: .automatic)
                }, completion: { finished in
                    // ...
                    self?.showStartLabel()
                })
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        }
    }
    
    func showStartLabel() {
        if realm.objects(Note.self).count > 0 {
            startLabel.isHidden = true
        } else {
            startLabel.isHidden = false
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm.objects(Note.self).count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        
        cell.textLabel?.text = realm.objects(Note.self)[indexPath.row].title
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        cell.detailTextLabel?.text = dateFormatter.string(from: date)
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedNote = realm.objects(Note.self)[indexPath.row]
        
        if let viewController = storyboard?.instantiateViewController(identifier: "NotesViewController") as? NotesViewController {
            viewController.noteToEdit = selectedNote
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            try! realm.write {
                let currentNote = realm.objects(Note.self)[indexPath.row]
                realm.delete(currentNote)
            }
        }
    }
}
