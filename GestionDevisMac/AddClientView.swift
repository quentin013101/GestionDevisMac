//
//  AddClientView.swift
//  GestionDevisMac
//
//  Created by Quentin FABERES on 26/02/2025.
//


import SwiftUI

struct AddClientView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var nom: String = ""
    @State private var email: String = ""

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Ajouter un Client")
                .font(.title)
                .padding()

            TextField("Nom du client", text: $nom)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Ajouter Client") {
                ajouterClient()
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }

    private func ajouterClient() {
        let client = Client(context: viewContext)
        client.nom = nom
        client.email = email

        try? viewContext.save()
    }
}

#Preview {
    AddClientView().environment(\.managedObjectContext, PersistenceController.shared.context)
}