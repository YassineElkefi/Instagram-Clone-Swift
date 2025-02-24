import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            HStack {
                // Profile Picture
                Image("profile_placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())

                Spacer()

                // Stats
                HStack(spacing: 20) {
                    ProfileStatView(value: "10", label: "Posts")
                    ProfileStatView(value: "5K", label: "Followers")
                    ProfileStatView(value: "500", label: "Following")
                }
            }
            .padding(.horizontal)

            // Username & Bio
            VStack(alignment: .leading, spacing: 4) {
                Text("username")
                    .font(.headline)
                Text("Cuba La famille")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // Edit Profile Button
            Button(action: {
                print("Edit Profile tapped")
            }) {
                Text("Edit Profile")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}

struct ProfileStatView: View {
    let value: String
    let label: String

    var body: some View {
        VStack {
            Text(value)
                .font(.headline)
            Text(label)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}
