import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Profile Header
                ProfileHeaderView()
                
                // Posts Grid
                PostGridView()
            }
        }
        .navigationTitle("Username")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
