//
//  SongList.swift
//  Network Request Test
//
//  Created by Israel Manzo on 12/21/22.
//

import SwiftUI

struct SongList: View {
    
    @StateObject var viewModel = SongListViewModel()
    
    @State var modal: ModalType? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.songs) {
                     song in
                    Button {
                        print("selected")
                    } label: {
                        Text(song.title)
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
        }
        .sheet(item: $modal, onDismiss: {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("❌ Error: \(error)")
                }
            }
        }) { modal in
            switch modal {
            case .add:
                AddUpdateSong(viewModel: AddUpdateSongViewModel())
            case .update(let song):
                AddUpdateSong(viewModel: AddUpdateSongViewModel(currentSong: song))
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchSongs()
                } catch {
                    print("❌ Error: \(error)")
                }
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
