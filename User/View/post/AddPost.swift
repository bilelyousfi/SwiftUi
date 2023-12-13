
//
//  AddPost.swift
//  Ecoshop
//
//  Created by gataga on 2/12/2023.
//

import SwiftUI
import Alamofire
struct AddPost: View {
    @State private var content: String = ""
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    @State private var showAlert = false

    @State private var issuccesSendPost = false

    @State private var iduser: String="6553fe22539c1e3985881aa2"

    var body: some View {
        NavigationView{
            VStack {
                TextField("Content", text: $content)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    isShowingImagePicker = true
                }) {
                    Text("Choose Image")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200, maxHeight: 200)
                        .padding()
                }
                
                Button(action: {
                    // Handle form submission
                    sendPost()
                    
                    
                }) {
                    Text("SEND")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .sheet(isPresented: $isShowingImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Success"),
                    message: Text("Post added successfully!"),
                    dismissButton: .default(Text("OK"))
                )
            }

        }
        .navigationTitle("ADD POST")
    }
    
    func sendPost() {
        guard let image = selectedImage else {
            // Handle case where no image is selected
            return
        }

        // Convert UIImage to Data
        guard let imageData = image.jpegData(compressionQuality: 0.8)else {
            // Handle error in converting image to data
            return
        }

        // Create the multipart form data using Alamofire
        AF.upload(
            multipartFormData: { formData in
                formData.append(Data(content.utf8), withName: "content")
                formData.append(imageData, withName: "media", fileName: "image.jpg", mimeType: "image/jpeg")
            },
            to: "http://192.168.1.87:9090/posts/addpost/\(iduser)"
        ).response {
            response in
            switch response.result {
            case .success:
                if let data = response.data{
                    print("response:\(String(data: data,encoding: .utf8) ?? "")")
                    issuccesSendPost = true
                    showAlert = true
                }
            case .failure(let error):
                print("error:\(error)")
            }
        }
    }
    
           
        }

        struct ImagePicker: UIViewControllerRepresentable {
            @Environment(\.presentationMode) var presentationMode
            @Binding var selectedImage: UIImage?
            
            func makeUIViewController(context: Context) -> UIImagePickerController {
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = context.coordinator
                return imagePicker
            }
            
            func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
            
            func makeCoordinator() -> Coordinator {
                Coordinator(self)
            }
            
            class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
                let parent: ImagePicker
                
                init(_ parent: ImagePicker) {
                    self.parent = parent
                }
                
                func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                    if let image = info[.originalImage] as? UIImage {
                        parent.selectedImage = image
                    }
                    parent.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        
struct AddPost_Previews: PreviewProvider {
    static var previews: some View {
        AddPost()
    }
}
