import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    // Grid Setup: Two flexible columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                // 1. Category Filters (Horizontal Scroll)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(["Architecture", "Minimalist", "Nature", "Neon"], id: \.self) { topic in
                            Button(action: { viewModel.updateTopic(topic: topic) }) {
                                Text(topic)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                                    .background(viewModel.searchText == topic ? Color.black : Color.gray.opacity(0.1))
                                    .foregroundColor(viewModel.searchText == topic ? .white : .black)
                                    .cornerRadius(20)
                            }
                        }
                    }
                    .padding()
                }
                
                // 2. The Image Grid
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.images) { image in
                        AsyncImage(url: URL(string: image.urls.regular)) { phase in
                            if let loadedImage = phase.image {
                                loadedImage
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 250)
                                    .cornerRadius(12)
                                    .clipped()
                            } else if phase.error != nil {
                                Color.red
                                    .frame(height: 250)
                            } else {
                                ProgressView()
                                    .frame(height: 250)
                            }
                        }
                        .onAppear {
                            
                            // When the last image appears, fetch more images by calling the fetchimages again
                            if image.id == viewModel.images.last?.id {
                                Task { await viewModel.fetchImages() }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Daily Design")
            .task {
                // Load initial data
                await viewModel.fetchImages()
            }
        }
    }
}

#Preview {
    HomeView()
}
