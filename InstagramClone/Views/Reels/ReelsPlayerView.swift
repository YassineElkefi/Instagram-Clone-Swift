import SwiftUI
import AVKit

struct ReelsPlayerView: View {
    let videoName: String
    @State private var player: AVPlayer?

    var body: some View {
        ZStack {
            // Video Player
            VideoPlayer(player: player)
                .onAppear {
                    if let path = Bundle.main.path(forResource: videoName, ofType: "mp4") {
                        player = AVPlayer(url: URL(fileURLWithPath: path))
                        player?.play()
                        player?.isMuted = true
                    }
                }
                .onDisappear {
                    player?.pause()
                }

            // Overlay UI (User details, like, comment, share buttons)
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("username")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("🔥 Amazing video!")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding()

                    Spacer()

                    VStack(spacing: 20) {
                        Button(action: {}) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        Text("120K")
                            .foregroundColor(.white)
                            .font(.caption)

                        Button(action: {}) {
                            Image(systemName: "message.fill")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        Text("5K")
                            .foregroundColor(.white)
                            .font(.caption)

                        Button(action: {}) {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .foregroundColor(.white)
                                .font(.title)
                        }
                        Text("Share")
                            .foregroundColor(.white)
                            .font(.caption)
                    }
                    .padding()
                }
                .background(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.5), .clear]), startPoint: .bottom, endPoint: .top))
            }
        }
    }
}

struct ReelsPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ReelsPlayerView(videoName: "video1")
            .edgesIgnoringSafeArea(.all)
    }
}
