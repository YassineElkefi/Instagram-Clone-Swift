import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Profile Header
                ProfileHeaderView()
                
                // Posts Grid
                PostGridView()
                
                // Add logout button directly in the view for testing
                Button(action: logoutUser) {
                    Text("Logout")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
            }
        }
        .navigationTitle(authManager.user?.username ?? "Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Logout") {
                    logoutUser()
                }
                .foregroundColor(.red)
            }
        }
    }
    
    private func logoutUser() {
        print("Logging out...")
        authManager.logout()
        // Don't use presentationMode.dismiss() here as it's likely not appropriate
        // The app root view should react to the authManager.isAuthenticated state change
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
                .environmentObject(AuthManager())
        }
    }
}
