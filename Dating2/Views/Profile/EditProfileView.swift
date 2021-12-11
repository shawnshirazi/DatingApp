//
//  EditProfileView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var aboutYou = ""
    @State var jobTitle = ""
    @State var school = ""
    @State var selected = 0
    @Environment(\.presentationMode) var presentation
    @State var imageSelected = UIImage()


    
    var body: some View {
        
        VStack {
            
            CustomNavBarView(presentation: _presentation, selected: $selected)

            GeometryReader {_ in
                
                if self.selected == 0 {
                                    
                    ScrollView(showsIndicators: false) {
                                        
                            VStack(alignment: .leading) {
                                ImageGridView()
                                
                                Text("About You")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.horizontal)
                                    .padding(.bottom, 10)
                                
                                TextField("About You", text: $aboutYou)
                                    .padding(.horizontal)
                                    .padding(.vertical, 32)
                                    .background(Color.white)
                                

                                Text("Job Title")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)

                                
                                TextField("Job Title", text: $jobTitle)
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    .background(Color.white)
                                
                                Text("School")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.horizontal)
                                    .padding(.vertical, 10)
                                
                                TextField("School", text: $school)
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    .background(Color.white)
                                    

                                

                            }
                            .background(Color("background-color"))
                    }
                    
                }
                else {
                    
                    CardView()
                    
                }
                
            }
            
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}



