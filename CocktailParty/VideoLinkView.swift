//
//  VideoLinkView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 27.08.2023.
//

import SwiftUI

struct VideoLinkView: View {
    //MARK: - PROPERTIES
    var link: String

    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Text("About cocktail")
                    .foregroundColor(AppColors.capeHoney)
                    .font(.subheadline)
                Spacer()
                Group {
                    Link(destination: URL(string: link)!) {
                        Image(systemName: "arrow.up.right.square")
                    }
                }//:GROUP
                .foregroundColor(AppColors.sunglow)
            }//:HSTACK
        }//:GROUPBOX
        .padding([.leading, .trailing])
    }
}

 //MARK: - PREVIEW
struct VideoLinkView_Previews: PreviewProvider {
    static var previews: some View {
        VideoLinkView(link: Cocktail.exampleFullTwo().video ?? "")
    }
}
