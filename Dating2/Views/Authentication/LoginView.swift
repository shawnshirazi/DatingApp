//
//  LoginView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
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
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)


                    
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 360, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    NavigationLink(
                        destination: SignupView().navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("Don't have an acccount?")
                                    .font(.system(size: 14))
                                
                                Text("Sign up")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .padding(.bottom, 40)
                        })
                }
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("Forgot Password?")
                        .font(.headline)
                        .foregroundColor(.white)
                })
                .padding(35)
                            
            }
            .background(Color.green)
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
