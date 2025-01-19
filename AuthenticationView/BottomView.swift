//
//  BottomView.swift
//  AuthenticationView
//
//  Created by Mine Rala on 19.01.2025.
//

import SwiftUI

struct BottomView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var authType: AuthType

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 3) {
                Text(authType == .login ? "Dont have an account?" : "Already have an account?")
                    .font(.system(size: 15, weight: .medium, design: .rounded))

                Button {
                    withAnimation {
                        authType = (authType == .login) ? .register : .login
                    }
                } label: {
                    Text(authType == .login ? "Register" : "Login")
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                }
            }

            HStack {
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundStyle(Color.gray.opacity(0.3))
                Text("OR")
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                Rectangle()
                    .frame(height: 1.5)
                    .foregroundStyle(Color.gray.opacity(0.3))
            }

            HStack(spacing: 20) {
                Button {

                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color.gray.opacity(0.3))
                        .overlay {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                }

                Button {

                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.5)
                        .frame(width: 40, height: 40)
                        .foregroundStyle(Color.gray.opacity(0.3))
                        .overlay {
                            Image("google")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20)
                                .foregroundStyle(colorScheme == .light ? .black : .white)
                        }
                }
            }
        }
    }
}

//#Preview {
//    BottomView()
//}
