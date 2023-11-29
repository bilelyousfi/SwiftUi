//
//  GradiantButton.swift
//  User
//
//  Created by Ayachi Zakaria on 25/11/2023.
//

import SwiftUI

struct GradiantButton: View {
    var title: String
    var icon: String
    var onClick: () ->()
    var body: some View {
        Button(action: onClick, label: {
            HStack(spacing: 15 ){
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.linearGradient(colors: [.yellow, .orange, .red], startPoint: .top, endPoint: .bottom), in: Capsule())
        })
    }
}

struct GradiantButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
