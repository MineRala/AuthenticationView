//
//  SegmentedView.swift
//  AuthenticationView
//
//  Created by Mine Rala on 19.01.2025.
//

import SwiftUI

struct SegmentedView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var authType: AuthType

    var body: some View {
        HStack(spacing: 0) {
            Button {
                withAnimation {
                    authType = .login
                }
            } label: {
                Text("Login")
                    .fontWeight(authType == .login ? .semibold : .regular)
                    .foregroundStyle(authType == .login ? (colorScheme == .light ? Color(uiColor: UIColor.darkGray) : .white) : .gray)
                    .padding(.vertical, 12)
                    .padding(.horizontal, authType == .login ? 30 : 20)
                    .background(
                        ZStack {
                            if authType == .login {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
                                    .zIndex(1)
                            }

                            RoundedRectangle(cornerRadius: 20)
                                .fill(authType == .login ? Color(UIColor.systemGray5) : Color(UIColor.systemGray6))
                                .zIndex(0)
                        }
                    )
            }

            Button {
                withAnimation {
                    authType = .register
                }
            } label: {
                Text("Register")
                    .fontWeight(authType == .register ? .semibold : .regular)
                    .foregroundStyle(authType == .register ? (colorScheme == .light ? Color(uiColor: UIColor.darkGray) : .white) : .gray)
                    .padding(.vertical, 12)
                    .padding(.horizontal, authType == .register ? 30 : 20)
                    .background(
                        ZStack {
                            if authType == .register {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black.opacity(0.3), lineWidth: 0.5)
                                    .zIndex(1)
                            }

                            RoundedRectangle(cornerRadius: 20)
                                .fill(authType == .register ? Color(UIColor.systemGray5) : Color(UIColor.systemGray6))
                                .zIndex(0)
                        }
                    )
            }

        }
        .background(
            Color(UIColor.systemGray6)
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .frame(maxWidth: .infinity)
    }

}

//#Preview {
//    SegmentedView()
//}
