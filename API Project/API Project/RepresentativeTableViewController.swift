//
//  RepresentativeTableViewController.swift
//  API Project
//
//  Created by Robert Steed on 12/7/22.
//

import UIKit

class RepresentativeTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var searchController: UISearchBar!
    
//    let searchController = UISearchController()
    let dogViewController = DogViewController()
    let representativeDataCollecter = RepresentativeDataCollecter()
    
    var members = [RepresentativeDataCollecter.Rep]()
    
    let queryOptions = [Int] ()
    
    var searchTask: Task<Void, Never>? = nil
    var tableViewImageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    var collectionViewImageLoadTasks: [IndexPath: Task<Void, Never>] = [:]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.delegate = self
//        navigationItem.searchController = searchController
//        searchController.searchResultsUpdater = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.automaticallyShowsSearchResultsController = true
//        searchController.searchBar.showsScopeBar = true
//        searchController.searchBar.scopeButtonTitles = ["THIS IS JUNK FIX IT LATER"]
       
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)  {
        Task {
            await fetchRepresentativeResponse(zipCode: searchText)
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(fetchRepresentativeResponse), object: nil)
        perform(#selector(fetchRepresentativeResponse), with: nil, afterDelay: 0.3)
    }
    
    @objc func fetchRepresentativeResponse(zipCode: String) async {
        
        
        self.members = []
        
//        let searchTerm = searchController.searchBar.text ?? ""
        
        do {
            // use the item controller to fetch items
            self.members = try await representativeDataCollecter.fetchRepresentativeResponse(zip: zipCode)
            
            self.tableView.reloadData()
            
        } catch let error as NSError where error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
            // ignore cancellation errors
        } catch {
            // otherwise, print an error to the console
            print(error)
        }
    }
    
//    @objc func fetchMatchingItems() {
//
//        self.info = []
//
//        let searchTerm = searchController.searchBar.text ?? ""
//        let mediaType = queryOptions[searchController.searchBar.selectedScopeButtonIndex]
//
//        // cancel existing task since we will not use the result
//        searchTask?.cancel()
//        searchTask = Task {
//            if !searchTerm.isEmpty {
//
//                // set up query dictionary
//                let query = [
//                    "name": name,
//                    "party": party,
//                    "state": state,
//                    "link": URL
//                ]
//
//                // use the item controller to fetch items
//                do {
//                    // use the item controller to fetch items
//                    let items = try await representativeDataCollecter.fetchItems(matching: query)
//                    if searchTerm == self.searchController.searchBar.text &&
//                          mediaType == queryOptions[searchController.searchBar.selectedScopeButtonIndex] {
//                        self.items = items
//                    }
//                } catch let error as NSError where error.domain == NSURLErrorDomain && error.code == NSURLErrorCancelled {
//                    // ignore cancellation errors
//                } catch {
//                    // otherwise, print an error to the console
//                    print(error)
//                }
//                // apply data source changes
//            } else {
//                // apply data source changes
//            }
//            searchTask = nil
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return members.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RTableViewCell", for: indexPath) as! RTableViewCell

        let members = members[indexPath.row]
        
        cell.nameLabel.text = members.name
        cell.partyLabel.text = members.party
        cell.stateLabel.text = members.state
        cell.linkLabel.text = members.link
        

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

}
