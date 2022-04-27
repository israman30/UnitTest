//
//  AddUpdatePost.swift
//  UnitTestingHTTP
//
//  Created by Israel Manzo on 4/26/22.
//

import SwiftUI

struct AddUpdatePost: View {
    @ObservedObject var viewModel: AddUpdateViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var text = ""
    
    var body: some View {
        VStack {
            TextField("song title", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button {
                viewModel.addUpdateAction {
                    presentationMode.wrappedValue.dismiss()
                }
            } label: {
                Text(viewModel.buttonTitle)
            }
        }
    }
}

struct AddUpdatePost_Previews: PreviewProvider {
    static var previews: some View {
        AddUpdatePost(viewModel: AddUpdateViewModel())
    }
}
