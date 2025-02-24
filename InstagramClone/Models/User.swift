struct LoginResponse: Codable {
    let token: String
    let user: UserData
}

struct UserData: Codable {
    let id: String
    let username: String // Note the lowercase 'u'
    let email: String
    let profileImage: String
}

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let profileImage: String
    let token: String?
}
