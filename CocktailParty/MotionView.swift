//
//  MotionView.swift
//  for CocktailParty
//
//  Created by Iuliia Filimonova on 20.09.2023
//


import SwiftUI

struct MotionView: View {
    // MARK: - PROPERTIES
    @StateObject private var viewModel = MotionViewModel()

    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...viewModel.circleNumber, id: \.self) { item in
                    Circle()
                        .foregroundColor(viewModel.randomColor())
                        .opacity(0.15)
                        .frame(width: viewModel.randomSize(), height: viewModel.randomSize(), alignment: .center)
                        .scaleEffect(viewModel.isAnimating ? viewModel.randomScale() : 1)
                        .position(
                            x: viewModel.randomCoordinate(max: geometry.size.width),
                            y: viewModel.randomCoordinate(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(viewModel.randomSpeed())
                                .delay(viewModel.randomDelay()),
                            value: viewModel.isAnimating
                        )
                        .onAppear(perform: {
                            viewModel.isAnimating = true
                        })
                } //: LOOP
            } //: ZSTACK
            .drawingGroup()
        } //: GEOMETRY
    }
}

#Preview {
    MotionView()
}
