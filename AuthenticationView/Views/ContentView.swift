//
//  ContentView.swift
//  AuthenticationView
//
//  Created by Mine Rala on 19.01.2025.
//

import SwiftUI

public enum AuthType {
    case login
    case register
}

struct ContentView: View {
    @State private var authType: AuthType = .login
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPass = false
    @State private var hasAgreedToTerm = false

    @FocusState private var isEmailFocued
    @FocusState private var isPassFocused

    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ScrollView(showsIndicators: false) {
            TopView()
            SegmentedView(authType: $authType)
            VStack(spacing: 15) {
                TextField(text: $email) {
                    Text("Email")
                }
                .focused($isEmailFocued)
                .textFieldStyle(AuthTextFieldStyle(isFocused: $isEmailFocued))
                ZStack(alignment: .trailing) {
                    if showPass {
                        TextField(text: $password) {
                            Text("Password")
                        }
                        .focused($isPassFocused)
                        .textFieldStyle(AuthTextFieldStyle(isFocused: $isPassFocused))
                    } else {
                        SecureField(text: $password) {
                            Text("Password")
                        }
                        .focused($isPassFocused)
                        .textFieldStyle(AuthTextFieldStyle(isFocused: $isPassFocused))
                    }
                    Button {
                        withAnimation {
                            showPass.toggle()
                        }
                    } label: {
                        Image(systemName: showPass ? "eye.fill" : "eye.slash.fill")
                            .padding()
                            .foregroundStyle(colorScheme == .light ? Color(uiColor: UIColor.darkGray) : Constants.CustomColor.lightGray)
                    }
                }

                if authType == .register {
                    HStack(alignment: .top) {
                        Toggle(isOn: $hasAgreedToTerm) {

                        }
                        .toggleStyle(AgreeStyle())
                        Text("I agree to the **Terms** and **Privacy Policy**.")
                    }
                }
            }
            Button {

            } label: {
                Text(authType == .login ? "Login" : "Register")
            }
            .buttonStyle(AuthButtonStyle())

            BottomView(authType: $authType)
        }
        .padding()
        .gesture(
            TapGesture()
                .onEnded({
                    isEmailFocued = false
                    isPassFocused = false
                })
        )
    }
}

#Preview {
    ContentView()
}
