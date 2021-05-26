//
//  NotesViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/20/21.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var titleText: UITextView!
    @IBOutlet weak var noteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func shareButtonPressed(_ sender: UIBarButtonItem) {
        let notes = [NotesModel(title: titleText.text, note: noteText.text)]
        
        let activityController = UIActivityViewController(activityItems: notes, applicationActivities: nil)
        present(activityController, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
