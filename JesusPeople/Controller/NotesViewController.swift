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
    
    
    @IBOutlet weak var titleText: UITextView!
    @IBOutlet weak var noteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.delegate = self
        noteText.delegate = self
        noteText.text = "new note..."
        noteText.textColor = .lightGray
        titleText.text = "Title"
        titleText.textColor = .lightGray
        
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        try! realm.write {
            
            let newNote = Note()
            newNote.title = titleText.text
            newNote.body = noteText.text
            realm.add(newNote)
        }
        
        //notes are added but tableview is not reloading until view is loaded again
        navigationController?.popViewController(animated: true)
        
    
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

