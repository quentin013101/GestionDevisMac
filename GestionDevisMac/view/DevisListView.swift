import SwiftUI
import CoreData

struct DevisListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Devis.entity(), // ✅ Spécifie que c'est une entité Devis
        sortDescriptors: [NSSortDescriptor(keyPath: \Devis.dateCreation, ascending: false)]
    ) private var devisList: FetchedResults<Devis> // ✅ Définir le bon type

    var body: some View {
        VStack {
            Text("Liste des Devis")
                .font(.title)
                .padding()
            
            List(devisList, id: \.self) { devis in
                HStack {
                    Text(devis.client?.nom ?? "Sans client") // ✅ Protection contre nil
                        .font(.headline)
                    Spacer()
                    Text("\(devis.montantTTC, specifier: "%.2f") €")
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
    }
}

#Preview {
    DevisListView().environment(\.managedObjectContext, PersistenceController.shared.context)
}
