import SwiftUI
import CoreData

struct AddPrestationView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var nom: String = ""
    @State private var prixUnitaire: Double = 0.0
    @Binding var isPresented: Bool // ✅ Pour fermer la `Sheet`

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
                    isPresented = false // ✅ Ferme la `Sheet`
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)

                Button("Ajouter Prestation") {
                    ajouterPrestation()
                    isPresented = false // ✅ Ferme la `Sheet` après ajout
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
    AddPrestationView(isPresented: .constant(true)).environment(\.managedObjectContext, PersistenceController.shared.context)
}
