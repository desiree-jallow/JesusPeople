//
//  NotesViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/20/21.
//

import UIKit

class NotesViewController: UIViewController, UITextViewDelegate {

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
        
        
        
    
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
        let notes = [NotesModel(title: titleText.text, note: noteText.text)]
        
        let activityController = UIActivityViewController(activityItems: notes, applicationActivities: nil)
        present(activityController, animated: true)
        
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

