//
//  TopView.swift
//  AuthenticationView
//
//  Created by Mine Rala on 19.01.2025.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75)

            Text("AuthFlow")
                .font(.system(size: 35, weight: .bold, design: .rounded))
        }
    }
}

#Preview {
    TopView()
}
