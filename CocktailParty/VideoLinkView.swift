//
//  VideoLinkView.swift
//  CocktailParty
//
//  Created by Юлия Филимонова on 27.08.2023.
//

import SwiftUI

struct VideoLinkView: View {
    //MARK: - PROPERTIES
    let link: String

    //MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Text(Constants.title)
                    .foregroundColor(AppColors.capeHoney)
                    .font(.subheadline)
                Spacer()
                Group {
                    if let url = URL(string: link) {
                        Link(destination: url) {
                            Image(systemName: Constants.linkArrow)
                        }
                    }
                }//:GROUP
                .foregroundColor(AppColors.sunglow)
            }//:HSTACK
        }//:GROUPBOX
        .padding([.leading, .trailing])
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let title = "About cocktail"
        static let linkArrow = "arrow.up.right.square"
    }
}

 //MARK: - PREVIEW
struct VideoLinkView_Previews: PreviewProvider {
    static var previews: some View {
        VideoLinkView(link: Cocktail.exampleFullTwo().video ?? "")
    }
}
