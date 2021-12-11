//
//  PhoneVerifyView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Firebase

struct PhoneVerifyView: View {
    
    @State var code = ""
    @Binding var show: Bool
    @Binding var ID: String
    @State var message = ""
    @State var alert = false
    @State var show2 = false
    @EnvironmentObject var viewModel: UserViewModel

    
    var body: some View {
        
            ZStack(alignment: .topLeading) {
                
                GeometryReader { _ in
                    
                    VStack(spacing: 10) {
                        
                        Text("Verification Code")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        
                        
                        Text("Please Enter The Verification Code")
                            .font(.body)
                            .foregroundColor(.gray)
                            .padding(.top, 12)
                        

                        TextField("code", text: $code)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color("Color"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.top, 15)
                        
                        NavigationLink(destination: AboutUserView(show2: $show2), isActive: $show2) {
                            Button(action: {
                                
                                let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                                
                                Auth.auth().signIn(with: credential) { (res, err) in
                                    
                                    if err != nil {
                                        
                                        self.message = (err?.localizedDescription)!
                                        self.alert.toggle()
                                        return
                                        
                                    }
                                    
                                    self.show2.toggle()

                                    //guard let uid = Auth.auth().currentUser?.uid else { return }

                                    /*
                                    if (Auth.auth().currentUser?.uid == COLLECTION_USERS.collectionID) {
                                        
                                        UserDefaults.standard.set(true, forKey: "status")
                                        
                                        NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                                        
                                    } else {
                                        self.show2.toggle()
                                    }
                                   */
                                }
                                
                            }, label: {
                                Text("Verify")
                                    .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                            })
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true)
                        }

                    
                    
                }
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                })
                .foregroundColor(.orange)
                
            }
            .padding()
            .alert(isPresented: $alert) {
                Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
        }
        }
        
    }
}

struct PhoneVerifyView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerifyView(show: .constant(true), ID: .constant(""))
    }
}
