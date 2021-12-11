//
//  SignupView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI

struct SignupView: View {
    @State var email = ""
    @State var password = ""
    @State var name = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var viewModel = AuthViewModel()
    
    var body: some View {
        VStack {
                        
            Text("LOGO PIC")
                .padding(100)
            
            VStack {
                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                CustomTextField(text: $name, placeholder: Text("Name"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                CustomSecureField(text: $password, placeholder: Text("Password"))
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                
                
                Button(action: {
                    viewModel.registerUser(email: email, password: password, name: name)
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 360, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding()
                })
                
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                })
            }
            
            Spacer()

                        
        }
        .background(Color.green)
        .ignoresSafeArea()
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
