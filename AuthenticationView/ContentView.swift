//
//  ContentView.swift
//  AuthenticationView
//
//  Created by Mine Rala on 19.01.2025.
//

import SwiftUI

enum AuthType {
    case login
    case register
}

struct ContentView: View {
  
    @State private var authType: AuthType = .login
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPass = false
    @FocusState private var isEmailFocued
    @FocusState private var isPassFocused
    @State private var hasAgreedToTerm = false

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
                ZStack {
                    TextField(text: $password) {
                        Text("Password")
                    }
                    .focused($isPassFocused)
                    .textFieldStyle(AuthTextFieldStyle(isFocused: $isPassFocused))
                    .overlay(alignment: .trailing, content: {
                        Button {
                            withAnimation {
                                showPass.toggle()
                            }
                        } label: {
                            Image(systemName: showPass ? "eye.fill" : "eye.slash.fill")
                                .padding()
                                .foregroundStyle(Constants.CustomColor.lightGray)
                        }
                    })
                    .opacity(showPass ? 1 : 0)
                    .zIndex(1)

                    SecureField(text: $password) {
                        Text("Password")
                    }
                    .focused($isPassFocused)
                    .textFieldStyle(AuthTextFieldStyle(isFocused: $isPassFocused))
                    .overlay(alignment: .trailing) {
                        Button {
                            withAnimation {
                                showPass.toggle()
                            }
                        } label: {
                            Image(systemName: showPass ? "eye.fill" : "eye.slash.fill")
                                .padding()
                                .foregroundStyle(Constants.CustomColor.lightGray)
                        }
                    }
                    .opacity(showPass ? 0 : 1)
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

struct AgreeStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 20)
                .contentTransition(.opacity)
        }
        .tint(.primary)
    }
}

struct AuthButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .foregroundStyle(.white)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .background(
                LinearGradient(stops: [
                    .init(color: Constants.CustomColor.lightBlue, location: 0.0),
                    .init(color: .blue, location: 1.0)
                ], startPoint: .leading, endPoint: .trailing)
            )
            .cornerRadius(15)
            .brightness(configuration.isPressed ? 0.05 : 0)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .padding(.vertical, 12)
    }
}

struct AuthTextFieldStyle: TextFieldStyle {
    @Environment(\.colorScheme) private var colorScheme
    let isFocused: FocusState<Bool>.Binding

    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(isFocused.wrappedValue ? Color.blue : Color.gray.opacity(0.5), lineWidth: 1)
                        .zIndex(1)

                    RoundedRectangle(cornerRadius: 16)
                        .fill(colorScheme == .light ? Constants.CustomColor.lightGray : Color(uiColor: UIColor.darkGray))
                        .zIndex(0)
                }
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused.wrappedValue)
    }
}

#Preview {
    ContentView()
}
