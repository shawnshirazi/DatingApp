//
//  ImageGridView.swift
//  Dating2
//
//  Created by Shawn Shirazi on 11/27/21.
//

import SwiftUI
import Kingfisher

struct ImageGridView: View {

    @StateObject var viewModel2 = UploadUserInfoViewModel()
    @EnvironmentObject var viewModel: UserViewModel

    @State var showImagePicker = false
    @State var showImagePicker2 = false
    @State var showImagePicker3 = false
    @State var showImagePicker4 = false
    @State var showImagePicker5 = false
    @State var showImagePicker6 = false
    
    @State var selectedUIImage: UIImage?
    @State var selectedUIImage2: UIImage?
    @State var selectedUIImage3: UIImage?
    @State var selectedUIImage4: UIImage?
    @State var selectedUIImage5: UIImage?
    @State var selectedUIImage6: UIImage?

    @State var image: Image?
    @State var image2: Image?
    @State var image3: Image?
    @State var image4: Image?
    @State var image5: Image?
    @State var image6: Image?
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    func loadImage2() {
        guard let selectedImage2 = selectedUIImage2 else { return }
        image2 = Image(uiImage: selectedImage2)
    }
    
    func loadImage3() {
        guard let selectedImage3 = selectedUIImage3 else { return }
        image3 = Image(uiImage: selectedImage3)
    }
    
    func loadImage4() {
        guard let selectedImage4 = selectedUIImage4 else { return }
        image4 = Image(uiImage: selectedImage4)
    }
    
    func loadImage5() {
        guard let selectedImage5 = selectedUIImage5 else { return }
        image5 = Image(uiImage: selectedImage5)
    }
    
    func loadImage6() {
        guard let selectedImage6 = selectedUIImage6 else { return }
        image6 = Image(uiImage: selectedImage6)
    }

    var body: some View {
                    
            VStack {                
                HStack {
                    
                    Button(action: {showImagePicker.toggle()}, label: {
                        ZStack(alignment: .bottomTrailing) {
                            if let image = image {
                                image
                                    .resizable()
                            } else if viewModel.user.ImageUrl == "" {
                                
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .clipShape(Circle())

                            } else {
                                KFImage(URL(string: viewModel.user.ImageUrl))
                                    .resizable()
                            }

                        }
                    })
                    .frame(width: 122)
                    .sheet(isPresented: $showImagePicker,
                           onDismiss: {
                            loadImage()
                            guard let image = selectedUIImage else { return }
                            viewModel2.uploadImage(image: image)
                    },content: {
                        ImagePicker(image: $selectedUIImage)
                    })
                    
                    
                    Button(action: {showImagePicker2.toggle()
                        guard let image2 = selectedUIImage2 else { return }
                        viewModel2.uploadImage2(image: image2)
                    }, label: {
                        ZStack(alignment: .bottomTrailing) {
                            if let image2 = image2 {
                                image2
                                    .resizable()
                            } else if viewModel.user.ImageUrl2 == "" {
                                
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .clipShape(Circle())

                            } else {
                                KFImage(URL(string: viewModel.user.ImageUrl2))
                                    .resizable()
                            }
                        }
                    })
                    .frame(width: 122)
                    .sheet(isPresented: $showImagePicker2,
                           onDismiss: {
                            loadImage2()
                            guard let image2 = selectedUIImage2 else { return }
                            viewModel2.uploadImage2(image: image2)
                    },content: {
                        ImagePicker(image: $selectedUIImage2)
                    })
                    
                    
                    Button(action: {showImagePicker3.toggle() }, label: {
                        ZStack(alignment: .bottomTrailing) {
                            if let image3 = image3 {
                                image3
                                    .resizable()
                            } else if viewModel.user.ImageUrl3 == "" {
                                
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .clipShape(Circle())

                            } else {
                                KFImage(URL(string: viewModel.user.ImageUrl3))
                                    .resizable()
                            }
                        }
                    })
                    .frame(width: 122)
                    .sheet(isPresented: $showImagePicker3,
                           onDismiss: {
                            loadImage3()
                            guard let image3 = selectedUIImage3 else { return }
                            viewModel2.uploadImage3(image: image3)
                    },content: {
                        ImagePicker(image: $selectedUIImage3)
                    })
                                               
                    
                }
                .frame(height: 170)
                
                HStack {
                    Button(action: {showImagePicker4.toggle() }, label: {
                        ZStack(alignment: .bottomTrailing) {
                            if let image4 = image4 {
                                image4
                                    .resizable()
                            }
                            else if viewModel.user.ImageUrl4 == "" {
                                
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .clipShape(Circle())

                            } else {
                                KFImage(URL(string: viewModel.user.ImageUrl4))
                                    .resizable()
                            }
                        }
                    })
                    .frame(width: 122)
                    .sheet(isPresented: $showImagePicker4,
                           onDismiss: {
                            loadImage4()
                            guard let image4 = selectedUIImage4 else { return }
                            viewModel2.uploadImage4(image: image4)
                    },content: {
                        ImagePicker(image: $selectedUIImage4)
                    })
                    
                    Button(action: {showImagePicker5.toggle() }, label: {
                        ZStack(alignment: .bottomTrailing) {
                            if let image5 = image5 {
                                image5
                                    .resizable()
                            } else if viewModel.user.ImageUrl5 == "" {
                                
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .clipShape(Circle())

                            } else {
                                KFImage(URL(string: viewModel.user.ImageUrl5))
                                    .resizable()
                            }
                        }
                    })
                    .frame(width: 122)
                    .sheet(isPresented: $showImagePicker5,
                           onDismiss: {
                            loadImage5()
                            guard let image5 = selectedUIImage5 else { return }
                            viewModel2.uploadImage5(image: image5)
                    },content: {
                        ImagePicker(image: $selectedUIImage5)
                    })
                    
                    Button(action: {showImagePicker6.toggle() }, label: {
                        ZStack(alignment: .bottomTrailing) {
                            if let image6 = image6 {
                                image6
                                    .resizable()
                            } else if viewModel.user.ImageUrl6 == "" {
                                
                                Image(systemName: "plus")
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .background(Color.gray)
                                    .clipShape(Circle())

                            } else {
                                KFImage(URL(string: viewModel.user.ImageUrl6))
                                    .resizable()
                            }
                        }
                    })
                    .frame(width: 122)
                    .sheet(isPresented: $showImagePicker6,
                           onDismiss: {
                            loadImage6()
                            guard let image6 = selectedUIImage6 else { return }
                            viewModel2.uploadImage6(image: image6)
                    },content: {
                        ImagePicker(image: $selectedUIImage6)
                    })
                }
                .frame(height: 170)
                
            }
            .padding(.horizontal, 5)
            .padding(.vertical)
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}

