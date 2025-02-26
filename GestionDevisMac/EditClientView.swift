import SwiftUI
import CoreData

struct EditClientView: View {
    @ObservedObject var client: Client
    var onSave: () -> Void
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Modifier le Client")
                .font(.title)
                .padding(.bottom, 10)

            // ✅ Type de Client
            HStack {
                Text("Type :")
                    .frame(width: 120, alignment: .leading)
                Picker("Type", selection: $client.type) {
                    Text("Particulier").tag("Particulier")
                    Text("Entreprise").tag("Entreprise")
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            // ✅ Civilité
            HStack {
                Text("Civilité :")
                    .frame(width: 120, alignment: .leading)
                Picker("Civilité", selection: $client.civilite) {
                    Text("M.").tag("M.")
                    Text("Mme").tag("Mme")
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            // ✅ Prénom & Nom
            TextField("Prénom", text: Binding($client.prenom, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Nom", text: Binding($client.nom, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // ✅ Numéro Fiscal
            TextField("Numéro Fiscal", text: Binding($client.numeroFiscal, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: client.numeroFiscal ?? "") { newValue in
                    client.numeroFiscal = newValue.filter { $0.isNumber }
                }

            // ✅ Email
            TextField("Email", text: Binding($client.email, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // ✅ Téléphone
            TextField("Téléphone", text: Binding($client.telephone, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            // ✅ Adresse
            TextField("Numéro et voie", text: Binding($client.adresseVoie, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Complément", text: Binding($client.complementAdresse, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Code Postal", text: Binding($client.codePostal, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Ville", text: Binding($client.ville, replacingNilWith: ""))
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Spacer()

            HStack {
                Button("Annuler") {
                    presentationMode.wrappedValue.dismiss()
                }
                .keyboardShortcut(.cancelAction)

                Spacer()

                Button("Enregistrer") {
                    try? viewContext.save()
                    onSave()
                    presentationMode.wrappedValue.dismiss()
                }
                .keyboardShortcut(.defaultAction)
            }
            .padding(.top, 10)

        }
        .padding()
        .frame(width: 450, height: 500)
    }
}

extension Binding {
    /// Permet de remplacer les valeurs nil par une valeur par défaut
    init(_ source: Binding<Value?>, replacingNilWith defaultValue: Value) {
        self.init(
            get: { source.wrappedValue ?? defaultValue },
            set: { source.wrappedValue = $0 }
        )
    }
}

#Preview {
    EditClientView(client: Client(), onSave: {})
}
