import Utilitys

@DomainConverter(UserDomainModel)
public struct User: Codable {
    let name: Int?
    let email: Bool?
    let phone: Double?
    let address: String?
    let nested: NestedModel?
}

public struct UserDomainModel {
    let name: Int
    let email: Bool
    let phone: Double
    let address: String
}

public struct NestedModelDomain {
    let name: String
    let email: String
}

@DomainConverter(NestedModelDomain)
public struct NestedModel: Codable {
    let name: String?
    let email: String?
}
