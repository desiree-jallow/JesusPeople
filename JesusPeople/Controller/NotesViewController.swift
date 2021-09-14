//
//  NotesViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/20/21.
//

import UIKit
import RealmSwift

class NotesViewController: UIViewController, UITextViewDelegate {
    let realm = try! Realm()
    var notesNotificationToken: NotificationToken?
    var noteToEdit: Note?
    
    
    @IBOutlet weak var titleText: UITextView!
    @IBOutlet weak var noteText: UITextView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.topItem?.title = tabBarController?.tabBar.selectedItem?.title
        
        super.viewDidLoad()
        titleText.delegate = self
        noteText.delegate = self
        
        if noteToEdit != nil {
            noteText.text = noteToEdit?.body
            titleText.text = noteToEdit?.title
        } else {
            noteText.text = "new note..."
            noteText.textColor = .lightGray
            titleText.text = "Title"
            titleText.textColor = .lightGray
        }
       
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        //observe changes
        if noteToEdit != nil {
            observeChange(for: noteToEdit!)
        } else {
            try! realm.write {
                
                let newNote = Note()
                newNote.title = titleText.text
                newNote.body = noteText.text
                realm.add(newNote)
            }
        }
      
        
        //notes are added but tableview is not reloading until view is loaded again
        navigationController?.popViewController(animated: true)
        
    
    }
    
    func observeChange(for note: Note) {
        notesNotificationToken = note.observe { change in
                switch change {
                case .change(let object, let properties):
                    for property in properties {
                        print("Property '\(property.name)' of object \(object) changed to '\(property.newValue!)'")
                    }
                case .error(let error):
                    print("An error occurred: \(error)")
                case .deleted:
                    print("The object was deleted.")
                }
            }
            // Now update to trigger the notification
            try! realm.write {
                note.title = titleText.text
                note.body = noteText.text
            }
    }
    
      
    
    //remove the placeholder text and change the text color to black
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .black
        
        }
        
    }
    
    //replace placeholder text if textview is empty
    func textViewDidEndEditing(_ textView: UITextView) {
        if titleText.text.isEmpty {
            titleText.text = "Title"
            titleText.textColor = .lightGray
           
        }
        
        if noteText.text.isEmpty {
            noteText.text = "new note..."
            noteText.textColor = .lightGray
            
        }
        
    }
    
}

