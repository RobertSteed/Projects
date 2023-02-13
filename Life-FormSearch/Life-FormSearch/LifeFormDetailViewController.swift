//
//  LifeFormDetailViewController.swift
//  Life-FormSearch
//
//  Created by Robert Steed on 1/29/23.
//

import UIKit
@MainActor
class LifeFormDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scientificNameLabel: UILabel!
    @IBOutlet weak var kingdomLabel: UILabel!
    @IBOutlet weak var familyLabel: UILabel!
    
    
    var loadInfoTask: Task<Void, Never>? = nil
    
    let item: EOLItem
    var license: String? = nil
    
    init?(coder: NSCoder, item: EOLItem) {
        self.item = item
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = item.commonName
        
        loadInfoTask = Task {
            do {
                let itemDetailRequest = EOLItemDetailAPIRequest(item: item)
                let details = try await EOLController.shared.sendRequest(itemDetailRequest)
                
                let taxonConcept = details.details.taxonConcepts?.first
                let dataObject = details.details.dataObjects?.first
        
                async let hierarchy = classificationDetails(for: taxonConcept)
                async let image = image(for: dataObject)
                
                update(hierarchy: try await hierarchy, image: try await image)
                
                scientificNameLabel.text = details.details.scientificName
                updateMediaDetail(with: dataObject)
                
                loadInfoTask = nil
            } catch {
                print(error)
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        loadInfoTask?.cancel()
    }
    
    func update(hierarchy: EOLHierarchy?, image: UIImage?) {
        if let hierarchy = hierarchy {
            updateClassificationDetails(with: hierarchy)
        }
        if let image = image {
            imageView.image = image
            
        }
    }
    
    func classificationDetails(for taxonConcept: TaxonConcept?) async throws -> EOLHierarchy? {
        guard let taxonConcept = taxonConcept else {
            return nil
        }
        let hierarchyRequest = EOLHierarchyAPIRequest(identifier: taxonConcept.identifier)
        let hierarchy = try await EOLController.shared.sendRequest(hierarchyRequest)
        
        return hierarchy
    }
    
    func updateClassificationDetails(with hierarchy: EOLHierarchy) {
        if let ancestors = hierarchy.ancestors {
            kingdomLabel.text = ancestors.first(where: {$0.taxonRank == "kingdom"})?.scientificName
            familyLabel.text = ancestors.first(where: {$0.taxonRank == "family"})?.scientificName
        }
    }
    
    func image(for dataObject: DataObject?) async throws -> UIImage? {
        guard let mediaURL = dataObject?.eolMediaURL else {
            return nil
        }
        let imageRequest = EOLImageAPIRequest(url: mediaURL)
        let image = try await EOLController.shared.sendRequest(imageRequest)
        
        return image
    }
    
    func updateMediaDetail(with dataObject: DataObject?) {
        guard let dataObject = dataObject else {
            return
        }
        if let agent = dataObject.agents?.first {
            if let fullName = agent.fullName {
            }
        }
        
    }
}
