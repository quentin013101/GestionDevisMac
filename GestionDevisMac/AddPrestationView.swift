import SwiftUI
import CoreData

struct AddPrestationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss // ✅ Ajout pour fermer la `Sheet`

    @State private var nom: String = ""
    @State private var prixUnitaire: Double = 0.0

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
                    dismiss() // ✅ Ferme la Sheet
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Ajouter Prestation") {
                    ajouterPrestation()
                    dismiss() // ✅ Ferme la Sheet après l'ajout
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
