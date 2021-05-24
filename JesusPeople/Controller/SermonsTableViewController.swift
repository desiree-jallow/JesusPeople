//
//  SermonsTableViewController.swift
//  JesusPeople
//
//  Created by Desiree on 5/20/21.
//

import UIKit
import GoogleAPIClientForREST
import GoogleSignIn

class SermonsTableViewController: UITableViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    private let scopes = [kGTLRAuthScopeYouTubeReadonly]

        private let service = GTLRYouTubeService()
        let signInButton = GIDSignInButton()
        let output = UITextView()
    
    
 

    @IBOutlet weak var sermonsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Configure Google Sign-in.
             GIDSignIn.sharedInstance().delegate = self
             GIDSignIn.sharedInstance().uiDelegate = self
             GIDSignIn.sharedInstance().scopes = scopes
             GIDSignIn.sharedInstance().signInSilently()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sermonCell", for: indexPath)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
                  showAlert(title: "Authentication Error", message: error.localizedDescription)
                  self.service.authorizer = nil
              } else {
                  self.signInButton.isHidden = true
                  self.output.isHidden = false
                  self.service.authorizer = user.authentication.fetcherAuthorizer()
                  fetchChannelResource()
              }
    }
    
    // List up to 10 files in Drive
        func fetchChannelResource() {
            let query = GTLRYouTubeQuery_ChannelsList.query(withPart: "snippet,statistics")
            query.identifier = "UC_x5XG1OV2P6uZZ5FSM9Ttw"
            // To retrieve data for the current user's channel, comment out the previous
            // line (query.identifier ...) and uncomment the next line (query.mine ...)
            // query.mine = true
            service.executeQuery(query,
                                 delegate: self,
                                 didFinish: #selector(displayResultWithTicket(ticket:finishedWithObject:error:)))
        }
    
    // Process the response and display output
    @objc func displayResultWithTicket(
          ticket: GTLRServiceTicket,
          finishedWithObject response : GTLRYouTube_ChannelListResponse,
          error : NSError?) {

          if let error = error {
              showAlert(title: "Error", message: error.localizedDescription)
              return
          }
        
        var outputText = ""
              if let channels = response.items, !channels.isEmpty {
                  let channel = response.items![0]
                  let title = channel.snippet!.title
                  let description = channel.snippet?.descriptionProperty
                  let viewCount = channel.statistics?.viewCount
                  outputText += "title: \(title!)\n"
                  outputText += "description: \(description!)\n"
                  outputText += "view count: \(viewCount!)\n"
              }
              output.text = outputText
          }
    
    
    // Helper for showing an alert
        func showAlert(title : String, message: String) {
            let alert = UIAlertController(
                title: title,
                message: message,
                preferredStyle: UIAlertController.Style.alert
            )
            let ok = UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default,
                handler: nil
            )
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }

}

