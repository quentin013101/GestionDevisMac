//
//  Prestation+CoreDataProperties.swift
//  GestionDevisMac
//
//  Created by Quentin FABERES on 26/02/2025.
//
//

import Foundation
import CoreData


extension Prestation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Prestation> {
        return NSFetchRequest<Prestation>(entityName: "Prestation")
    }

    @NSManaged public var prixUnitaire: Double
    @NSManaged public var nom: String?
    @NSManaged public var unite: String?
    @NSManaged public var devis: NSSet?

}

// MARK: Generated accessors for devis
extension Prestation {

    @objc(addDevisObject:)
    @NSManaged public func addToDevis(_ value: Devis)

    @objc(removeDevisObject:)
    @NSManaged public func removeFromDevis(_ value: Devis)

    @objc(addDevis:)
    @NSManaged public func addToDevis(_ values: NSSet)

    @objc(removeDevis:)
    @NSManaged public func removeFromDevis(_ values: NSSet)

}

extension Prestation : Identifiable {

}
