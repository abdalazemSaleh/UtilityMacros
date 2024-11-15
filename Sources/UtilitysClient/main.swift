import Utilitys

@DomainConverter(UserDomainModel)
public struct User: Codable {
    let name: Int?
    let email: Bool?
    let phone: Double?
    let address: String?
}

public struct UserDomainModel {
    let name: Int
    let email: Bool
    let phone: Double
    let address: String
}
