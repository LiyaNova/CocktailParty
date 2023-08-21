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
            ZStack {
                Circle()
                    .fill(AppColors.bronzeOlive)
                    .frame(width: 26, height: 26)
                    .overlay(Circle().stroke(Color.white))
                Image(systemName: "chevron.left")
                    .imageScale(.small)
            }
        }
    }
}

 //MARK: - PREVIEW
struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
            .previewLayout(.fixed(width: 60, height: 60))
            .padding()
    }
}
