//
//  LifeFormTableViewController.swift
//  Life-FormSearch
//
//  Created by Robert Steed on 1/29/23.
//

import UIKit

class LifeFormTableViewController: UITableViewController, UISearchResultsUpdating {
    
    
    func updateSearchResults(for searchController: UISearchController) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(fetchMatchingItems), object: nil)
        perform(#selector(fetchMatchingItems), with: nil, afterDelay: 0.3)
    }
    

    var searchTask: Task<Void, Never>? = nil
    
    var items = [EOLItem]()
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.automaticallyShowsSearchResultsController = true
        searchController.searchBar.showsScopeBar = true

    }
    
    @objc func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchController.searchBar.text ?? ""
        
        if !searchTerm.isEmpty {
            let searchRequest = EOLSearchAPIRequest(searchTerm: searchTerm)
            searchTask?.cancel()
            searchTask = Task {
                do {
                    let searchResults = try await EOLController.shared.sendRequest(searchRequest)
                    self.items = searchResults.results
                    self.tableView.reloadData()
                } catch {
                    print(error)
                }
                searchTask = nil
            }
        }
    }
    
    @IBSegueAction func showItemDetails(_ coder: NSCoder, sender: Any?) -> LifeFormDetailViewController? {
        guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else {
            return nil
        }
        
        let item = items[indexPath.row]
        return LifeFormDetailViewController(coder: coder, item: item)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        let item = items[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = item.commonName
        content.secondaryText = item.scientificName
        cell.contentConfiguration = content

        return cell
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}


