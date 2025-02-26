import SwiftUI
import AppKit // ✅ Importer AppKit pour macOS

struct AddPrestationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var nom: String = ""
    @State private var prixUnitaire: Double = 0.0
    @Environment(\.dismiss) private var dismiss // ✅ Utilisé pour les `Sheet`

    var body: some View {
        VStack {
            Text("Ajouter une Prestation")
                .font(.title)
                .padding()

            TextField("Nom de la prestation", text: $nom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Prix Unitaire", value: $prixUnitaire, formatter: decimalFormatter)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button("Annuler") {
                    fermerFenetreCorrectement() // ✅ Ferme correctement la fenêtre
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Ajouter Prestation") {
                    ajouterPrestation()
                    fermerFenetreCorrectement() // ✅ Ferme correctement la fenêtre
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        .padding()
    }

    private func ajouterPrestation() {
        let prestation = Prestation(context: viewContext)
        prestation.nom = nom
        prestation.prixUnitaire = prixUnitaire
        try? viewContext.save()
    }

    /// ✅ Nouvelle fonction qui ferme la fenêtre **correctement** sur macOS
    private func fermerFenetreCorrectement() {
        if let window = NSApplication.shared.keyWindow {
            window.close() // ✅ Ferme la fenêtre active
        } else {
            dismiss() // ✅ Alternative pour les `Sheet`
        }
    }
}

// ✅ Formatter pour afficher les prix avec 2 décimales
let decimalFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    return formatter
}()

#Preview {
    AddPrestationView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
