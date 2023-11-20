//
//  ContentView.swift
//  Swift qUIz
//
//  Created by BENAMMOUR Ayman on 20/11/2023.
//

import SwiftUI

struct Vinyl {
    var coverImage: Image
    var trackNames: [String]
    var releaseDate: Date
    var numberOfCDs: Int
}

struct ImagePicker: View {
    @Binding var image: Image

    var body: some View {
        Button(action: {
            // Ici, vous pouvez ajouter le code pour sélectionner une image
            // par exemple, en utilisant UIImagePickerController
        }) {
            image
                .resizable()
                .scaledToFit()
        }
    }
}

struct ContentView: View {
    @State private var vinyl = Vinyl(
        coverImage: Image(systemName: "photo"), // Placeholder image
        trackNames: [],
        releaseDate: Date(),
        numberOfCDs: 1
    )

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informations du Vinyle")) {
                    ImagePicker(image: $vinyl.coverImage)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 200)

                    TextField("Nom des tracks", text: .constant(vinyl.trackNames.joined(separator: ", ")))
                        .disabled(true)

                    DatePicker("Date de sortie", selection: $vinyl.releaseDate, displayedComponents: .date)
                    
                    Stepper("Nombre de CD", value: $vinyl.numberOfCDs, in: 1...10)
                }

                Section {
                    Button("Sauvegarder") {
                        // Ici, vous pouvez ajouter le code pour sauvegarder les données
                        // par exemple, stocker dans une base de données ou utiliser UserDefaults
                    }
                }
            }
            .navigationBarTitle("Vinyle Details")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
