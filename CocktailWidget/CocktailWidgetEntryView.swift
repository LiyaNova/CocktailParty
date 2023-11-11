//
//  CocktailWidgetEntryView.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 09.11.2023
//
    

import WidgetKit
import SwiftUI

struct CocktailWidgetEntryView : View {
    var entry: CocktailWidgetEntry

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                //IMAGE
                if let image = entry.cocktail.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }
                //TEXT
                VStack {
                    Text("\(entry.cocktail.name ?? "")")
                        .foregroundColor(AppColors.sunglow)
                        .font(.system(.caption2, design: .rounded)).bold()
                        .multilineTextAlignment(.center)
                        .padding(.leading, Constants.imageSize + Constants.textTrailing)
                        .padding(.trailing, Constants.textTrailing)
                        .padding(.vertical, Constants.textVertical)
                        .background {
                            Color(AppColors.zeus)

                        }
                        .clipShape(RoundedRectangle(cornerRadius: Constants.textTrailing))
                        .overlay(alignment: .leading) {
                            //LOGO IMAGE
                            Image(Constants.logo)
                              .resizable()
                              .frame(width: Constants.imageSize, height: Constants.imageSize)
                              .clipShape(Circle())
                              .padding(.leading, Constants.logoLeading)
                        }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, Constants.vStackBottom)
                .padding(.horizontal, Constants.vStackHorizontal)
            }
        }
    }

    //MARK: - CONSTANTS
    private struct Constants {
        static let imageSize: CGFloat = 20
        static let textTrailing: CGFloat = 6
        static let textVertical: CGFloat = 3
        static let logoLeading: CGFloat = 2
        static let vStackBottom: CGFloat = 4
        static let vStackHorizontal: CGFloat = 8

        static let logo = "logo"
    }
}
