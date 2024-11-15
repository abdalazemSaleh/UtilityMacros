// The Swift Programming Language
// https://docs.swift.org/swift-book

@attached(extension, names: named(toDomain))
public macro DomainConverter<T>(_ targetModel: T) = #externalMacro(module: "UtilitysMacros", type: "DomainConverter")
