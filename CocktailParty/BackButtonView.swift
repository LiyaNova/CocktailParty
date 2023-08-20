//
//  BackButtonView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 20.08.2023.
//

import SwiftUI

struct BackButtonView: View {
    //MARK: - PROPERTIES
    @Environment(\.dismiss) private var dismiss

    //MARK: - BODY
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
            //TODO
        }
    }
}

 //MARK: - PREVIEW
struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
            .previewLayout(.fixed(width: 100, height: 100))
            .padding()
    }
}
