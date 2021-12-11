//
//  PhoneAuthView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase

struct PhoneAuthView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var code2 = ""
    @State var no = ""
    @State var show = false
    @State var message = ""
    @State var alert = false
    @State var ID = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                
                Text("Verify your number")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                
                Text("Please Enter Your Number To Verify Your Account")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 12)
                
                HStack {
                    TextField("+1", text: $code2)
                        .keyboardType(.numberPad)
                        .frame(width: 45)
                        .padding()
                        .background(Color("Color"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    
                    TextField("Number", text: $no)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color("Color"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                }
                .padding(.top, 15)
                .padding(.horizontal, 15)
                
                NavigationLink(destination: PhoneVerifyView(show: $show, ID: $ID), isActive: $show) {
                    
                    Button(action: {
                        
                        PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.code2+self.no, uiDelegate: nil) { (ID, err) in
                            
                            if err != nil {
                                self.message = (err?.localizedDescription)!
                                self.alert.toggle()
                                return
                            }
                            
                            self.ID = ID!
                            self.show.toggle()
                        }
                        
                    }, label: {
                        Text("Send")
                            .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                    })
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(10)
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
            }
        }
    }
}

struct PhoneAuthView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneAuthView()
    }
}
