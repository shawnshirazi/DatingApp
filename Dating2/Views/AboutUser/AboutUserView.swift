///Users/shawnshirazi/Desktop/PROJECTS/Dating2/Dating2/ViewModels/UploadUserInforViewModel.swift
//  AboutUserView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI

struct AboutUserView: View {
    
    @StateObject var viewModelUpload = UploadUserInfoViewModel()
    @State var name = ""
    @State var gender = ""
    @State var SO = ""
    @State var age = ""
    @Binding var show2: Bool
   // @Binding var push: Bool

    var body: some View {
        
            VStack {
                Form {
                    Text("About you")

                    Section(header: Text(""))
                    {
                        TextField("Name", text: $name)
                        TextField("Gender", text: $gender)
                        TextField("Sexual Orientation", text: $SO)
                        TextField("Age", text: $age)

                        /*
                        Picker("State", selection: $selectedState) {
                            ForEach(states, id: \.self) {
                                Text($0)
                            }
                        }
                        */
                    
                        
                    }
                    
                    //NavigationLink(destination: FullCardView()) {
                        Button (action: {
                            viewModelUpload.uploadInfo(name: name, gender: gender, SO: SO, age: age);
                            
                            UserDefaults.standard.set(true, forKey: "status")
                            
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                            

                        }, label: {
                            Text("Submit")
                    })
                    //}
                    
                }

        }
        
    }
}


struct AboutUserView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUserView(show2: .constant(true))
            .environmentObject(UploadUserInfoViewModel())
    }
}

