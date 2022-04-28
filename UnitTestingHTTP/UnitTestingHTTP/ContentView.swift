//
//  ContentView.swift
//  UnitTestingHTTP
//
//  Created by Israel Manzo on 4/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var postViewModel = PostListViewModel(HttpClient())
    @State var modal: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(postViewModel.posts) { post in
                    Button {
                        print("selected")
                    } label: {
                        Text(post.title)
                            .font(.title3)
                            .foregroundColor(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("🎵 Songs"))
            .toolbar {
                Button {
                    modal = .add
                } label: {
                    Label("Add Song", systemImage: "plus.circle")
                }
            }
            .onAppear {
                Task {
                    do {
                        try await postViewModel.fetchPost()
                    } catch {
                        print("❌ Error: \(error)")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
