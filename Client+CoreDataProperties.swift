//
//  Client+CoreDataProperties.swift
//  GestionDevisMac
//
//  Created by Quentin FABERES on 26/02/2025.
//
//

import Foundation
import CoreData


extension Client {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Client> {
        return NSFetchRequest<Client>(entityName: "Client")
    }

    @NSManaged public var adresseVoie: String?
    @NSManaged public var civilite: String?
    @NSManaged public var codePostal: String?
    @NSManaged public var complementAdresse: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var nom: String?
    @NSManaged public var numeroFiscal: String?
    @NSManaged public var prenom: String?
    @NSManaged public var telephone: String?
    @NSManaged public var type: String?
    @NSManaged public var ville: String?
    @NSManaged public var devis: NSSet?

}

// MARK: Generated accessors for devis
extension Client {

    @objc(addDevisObject:)
    @NSManaged public func addToDevis(_ value: Devis)

    @objc(removeDevisObject:)
    @NSManaged public func removeFromDevis(_ value: Devis)

    @objc(addDevis:)
    @NSManaged public func addToDevis(_ values: NSSet)

    @objc(removeDevis:)
    @NSManaged public func removeFromDevis(_ values: NSSet)

}

extension Client : Identifiable {

}
