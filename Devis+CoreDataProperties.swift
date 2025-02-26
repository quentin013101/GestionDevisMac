//
//  Devis+CoreDataProperties.swift
//  GestionDevisMac
//
//  Created by Quentin FABERES on 26/02/2025.
//
//

import Foundation
import CoreData


extension Devis {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Devis> {
        return NSFetchRequest<Devis>(entityName: "Devis")
    }

    @NSManaged public var dateCreation: Date?
    @NSManaged public var fraisAnnexesRaw: Double
    @NSManaged public var id: UUID?
    @NSManaged public var remiseRaw: Double
    @NSManaged public var statutRaw: String?
    @NSManaged public var statut: String?
    @NSManaged public var montantTTC: NSDecimalNumber?
    @NSManaged public var client: Client?
    @NSManaged public var prestations: NSSet?

}

// MARK: Generated accessors for prestations
extension Devis {

    @objc(addPrestationsObject:)
    @NSManaged public func addToPrestations(_ value: Prestation)

    @objc(removePrestationsObject:)
    @NSManaged public func removeFromPrestations(_ value: Prestation)

    @objc(addPrestations:)
    @NSManaged public func addToPrestations(_ values: NSSet)

    @objc(removePrestations:)
    @NSManaged public func removeFromPrestations(_ values: NSSet)

}

extension Devis : Identifiable {

}
