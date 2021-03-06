import Foundation
import Swagger

typealias Context = [String: Any?]

public class CodeFormatter {
    var spec: SwaggerSpec
    var filenames: [String] = []
    var enums: [Enum] = []
    let templateConfig: TemplateConfig
    var modelPrefix: String?
    var modelSuffix: String?

    public init(spec: SwaggerSpec, templateConfig: TemplateConfig) {
        self.spec = spec
        self.templateConfig = templateConfig
        modelPrefix = templateConfig.getStringOption("modelPrefix")
        modelSuffix = templateConfig.getStringOption("modelSuffix")
    }

    var disallowedNames: [String] {
        []
    }

    var disallowedTypes: [String] {
        []
    }

    public func getContext() -> [String: Any] {
        getSpecContext().clean()
    }

    func getSpecContext() -> Context {
        var context: Context = [:]

        context["raw"] = spec.json
        enums = spec.enums
        context["enums"] = enums.map(getEnumContext)
        context["paths"] = spec.paths.map(getPathContext)
        context["operations"] = spec.operations.map(getOperationContext)
        context["tags"] = spec.tags
        context["operationsByTag"] = spec.operationsByTag.map { ["name": $0, "operations": $1.map(getOperationContext)] }
        context["definitions"] = spec.definitions.map(getDefinitionContext)
        context["info"] = getSpecInformationContext(spec.info)
        context["host"] = spec.host
        context["basePath"] = spec.basePath
        context["securityDefinitions"] = spec.securityDefinitions.map(getSecurityDefinitionContext)

        let scheme = (spec.schemes?.first?.rawValue).flatMap { "\($0)://" }
        context["baseURL"] = "\(scheme ?? "")\(spec.host?.absoluteString ?? "")\(spec.basePath ?? "")"

        return context
    }

    func getSecurityDefinitionContext(_ securityDefinition: SecuritySchema) -> Context {
        var context: Context = [:]

        context["name"] = securityDefinition.name
        context["raw"] = securityDefinition.json

        return context
    }

    func getSpecInformationContext(_ info: Info) -> Context {
        var context: Context = [:]

        context["title"] = info.title.description
        context["description"] = info.description
        context["version"] = info.version

        return context
    }

    func getDefinitionContext(_ schema: SwaggerObject<Schema>) -> Context {
        var context = getSchemaContext(schema.value)

        context["type"] = getSchemaTypeName(schema)

        let schemaType = getSchemaType(name: schema.name, schema: schema.value)

        switch schema.value.type {
        case .simple:
            context["simpleType"] = schemaType
            context["aliasType"] = schemaType
            if let enumValue = schema.value.getEnum(name: schema.name, description: schema.value.metadata.description) {
                context["enum"] = getEnumContext(enumValue)
            }
        case .reference:
            context["referenceType"] = schemaType
            context["aliasType"] = schemaType
        case .array:
            context["arrayType"] = schemaType
            context["aliasType"] = schemaType
        default: break
        }

        return context
    }

    func getSchemaTypeName(_ schema: SwaggerObject<Schema>) -> String {
        if case .simple = schema.value.type,
            schema.value.getEnum(name: schema.name, description: schema.value.metadata.description) != nil {
            return getEnumType(schema.name)
        } else {
            return getModelType(schema.name)
        }
    }

    func getInlineSchemaContext(_ schema: Schema, name: String) -> Context? {
        guard schema.generateInlineSchema else { return nil }

        var context: Context = [:]

        context["type"] = escapeType(name.upperCamelCased())
        context["requiredProperties"] = schema.requiredProperties.map(getPropertyContext)
        context["optionalProperties"] = schema.optionalProperties.map(getPropertyContext)
        context["properties"] = schema.properties.map(getPropertyContext)
        context["allProperties"] = schema.properties.map(getPropertyContext)
        context["enums"] = schema.enums.map(getEnumContext)

        context["schemas"] = schema.properties.compactMap { property in
            getInlineSchemaContext(property.schema, name: property.name)
        }
        return context
    }

    func getSchemaContext(_ schema: Schema) -> Context {
        var context: Context = [:]

        context["raw"] = schema.metadata.json

        if let parent = schema.parent {
            context["parent"] = getDefinitionContext(parent)
        }

        context["description"] = schema.metadata.description
        context["requiredProperties"] = schema.requiredProperties.map(getPropertyContext)
        context["optionalProperties"] = schema.optionalProperties.map(getPropertyContext)
        context["properties"] = schema.properties.map(getPropertyContext)
        context["allProperties"] = schema.parentProperties.map(getPropertyContext)
        context["enums"] = schema.enums.map(getEnumContext)

        context["schemas"] = schema.properties.compactMap { property in
            getInlineSchemaContext(property.schema, name: property.name)
        }
        return context
    }

    func getPathContext(_ path: Path) -> Context {
        var context: Context = [:]

        context["path"] = path.path
        context["parameters"] = path.parameters.map { $0.value }.map(getParameterContext)
        context["operations"] = path.operations.map(getOperationContext)

        return context
    }

    func getOperationContext(_ operation: Swagger.Operation) -> Context {
        var context: Context = [:]

        if let operationId = operation.identifier {
            context["operationId"] = operationId
            context["type"] = escapeType(operationId.upperCamelCased())
        } else {
            let pathParts = operation.path.components(separatedBy: "/")
            var pathName = pathParts.map { $0.upperCamelCased() }.joined(separator: "")
            pathName = pathName.replacingOccurrences(of: "\\{(.*?)\\}", with: "By_$1", options: .regularExpression, range: nil)
            let generatedOperationId = operation.method.rawValue.lowercased() + pathName.upperCamelCased()
            context["operationId"] = generatedOperationId
            context["type"] = escapeType(generatedOperationId.upperCamelCased())
        }

        context["raw"] = operation.json
        context["method"] = operation.method.rawValue.uppercased()
        context["path"] = operation.path
        context["description"] = operation.description
        context["tag"] = operation.tags.first
        context["tags"] = operation.tags

        let params = operation.parameters.map { $0.value }

        context["params"] = params.map(getParameterContext)
        context["hasBody"] = params.contains { $0.location == .body || $0.location == .formData }
        context["nonBodyParams"] = params.filter { $0.location != .body }.map(getParameterContext)
        context["encodedParams"] = params.filter { $0.location == .formData || $0.location == .query }.map(getParameterContext)
        if let bodyParam = operation.bodyParam {
            context["bodyParam"] = getParameterContext(bodyParam.value)
        }
        context["pathParams"] = operation.getParameters(type: .path).map(getParameterContext)
        context["queryParams"] = operation.getParameters(type: .query).map(getParameterContext)
        context["formParams"] = operation.getParameters(type: .formData).map(getParameterContext)
        context["headerParams"] = operation.getParameters(type: .header).map(getParameterContext)
        context["hasFileParam"] = params.contains { $0.metadata.type == .file }
        context["securityRequirement"] = operation.security?.first.flatMap(getSecurityRequirementContext)
        context["securityRequirements"] = operation.security?.map(getSecurityRequirementContext)

        // Responses

        let responses = operation.responses
        let successResponse = responses.first { $0.successful }
        let successResponses = responses.filter { $0.successful }.map(getResponseContext)
        let failureResponses = responses.filter { !$0.successful }.map(getResponseContext)

        context["responses"] = responses.map(getResponseContext)
        context["successResponse"] = successResponses.first
        context["successType"] = successResponse.flatMap(getResponseContext)?["type"]
        context["defaultResponse"] = responses.first { $0.statusCode == nil }.flatMap(getResponseContext)
        context["onlySuccessReponses"] = successResponses.count == responses.count
        context["alwaysHasResponseType"] = responses.filter { $0.response.value.schema != nil }.count == responses.count

        let successTypes = successResponses.compactMap { $0["type"] as? String }
        let failureTypes = failureResponses.compactMap { $0["type"] as? String }

        if Set(successTypes).count == 1 {
            context["singleSuccessType"] = successTypes.first
        }
        if Set(failureTypes).count == 1 {
            context["singleFailureType"] = failureTypes.first
        }

        context["enums"] = operation.enums.map(getEnumContext)
        context["requestEnums"] = operation.requestEnums.map(getEnumContext)
        context["responseEnums"] = operation.responseEnums.map(getEnumContext)

        let requestSchemas: [Context] = operation.parameters.compactMap { parameter in
            guard case let .body(schema) = parameter.value.type else { return nil }
            return getInlineSchemaContext(schema, name: parameter.value.name)
        }
        context["requestSchemas"] = requestSchemas

        let responseSchemas: [Context] = operation.responses.compactMap { response in
            guard let schema = response.response.value.schema else { return nil }
            return getInlineSchemaContext(schema, name: response.name.lowerCamelCased())
        }
        context["responseSchemas"] = responseSchemas
        context["hasResponseModels"] = !operation.responses.filter { $0.response.value.schema != nil }.isEmpty

        return context
    }

    func getResponseContext(_ response: OperationResponse) -> Context {
        var context: Context = [:]

        context["success"] = response.successful
        context["name"] = response.name.lowerCamelCased()
        context["statusCode"] = response.statusCode
        context["success"] = response.successful
        context["schema"] = response.response.value.schema.flatMap(getSchemaContext)
        context["description"] = response.response.value.description.description
        context["type"] = response.response.value.schema.flatMap { getSchemaType(name: response.name, schema: $0) }

        return context
    }

    func getSecurityRequirementContext(_ securityRequirement: SecurityRequirement) -> Context {
        var context: Context = [:]

        context["name"] = securityRequirement.name
        context["scope"] = securityRequirement.scopes.first
        context["scopes"] = securityRequirement.scopes

        return context
    }

    func getParameterContext(_ parameter: Parameter) -> Context {
        var context: Context = [:]

        context["raw"] = parameter.metadata.json
        context["name"] = getName(parameter.name)
        context["value"] = parameter.name
        context["example"] = parameter.example
        context["required"] = parameter.required
        context["optional"] = !parameter.required
        context["parameterType"] = parameter.location.rawValue
        context["isFile"] = parameter.metadata.type == .file
        context["description"] = parameter.description

        if case let .other(items) = parameter.type,
            case .array = items.type {
            context["isArray"] = true
        }
        switch parameter.type {
        case let .body(schema): context["type"] = getSchemaType(name: parameter.name, schema: schema)
        case let .other(item): context["type"] = getItemType(name: parameter.name, item: item)
        }

        return context
    }

    func getPropertyContext(_ property: Property) -> Context {
        var context: Context = getSchemaContext(property.schema)

        if let json = context["raw"] as? [String: Any] {
            var newJson = json
            newJson["name"] = property.name
            context["raw"] = newJson
        }

        context["required"] = property.required
        context["optional"] = !property.required
        context["name"] = getName(property.name)
        context["value"] = property.name
        context["type"] = getSchemaType(name: property.name, schema: property.schema)

        if case .array = property.schema.type {
            context["isArray"] = true
        }

        return context
    }

    func getEnumContext(_ enumValue: Enum) -> Context {
        var context: Context = [:]

        var specEnum: Enum?
        for globalEnum in enums {
            if String(describing: globalEnum.cases) == String(describing: enumValue.cases) {
                specEnum = globalEnum
                break
            }
        }
        context["enumName"] = getEnumType(enumValue.name)

        if let specEnum = specEnum {
            context["enumName"] = getEnumType(specEnum.name)
            context["isGlobal"] = true
        }
        context["enums"] = enumValue.cases.map { ["name": getName("\($0)"), "value": $0] }
        context["description"] = specEnum?.description ?? enumValue.description
        context["raw"] = enumValue.metadata.json

        switch enumValue.type {
        case let .schema(schema): context["type"] = getSchemaType(name: "", schema: schema, checkEnum: false)
        case let .item(item): context["type"] = getItemType(name: "", item: item, checkEnum: false)
        }
        return context
    }

    func escapeString(_ string: String) -> String {
        let replacements: [String: String] = [
            ">=": "greaterThanOrEqualTo",
            "<=": "lessThanOrEqualTo",
            ">": "greaterThan",
            "<": "lessThan",
            "$": "dollar",
            "%": "percent",
            "#": "hash",
            "@": "alpha",
            "&": "and",
        ]
        var escapedString = string
        for (symbol, replacement) in replacements {
            escapedString = escapedString.replacingOccurrences(of: symbol, with: replacement)
        }
        escapedString = String(String.UnicodeScalarView(escapedString.unicodeScalars.filter { CharacterSet.alphanumerics.contains($0) }))

        // prepend _ strings starting with numbers
        if let firstCharacter = escapedString.unicodeScalars.first,
            CharacterSet.decimalDigits.contains(firstCharacter) {
            escapedString = "_\(escapedString)"
        }

        if escapedString.isEmpty || escapedString == "_" {
            escapedString = "UNKNOWN234"
        }
        return escapedString
    }

    // MARK: name and types

    func getName(_ name: String) -> String {
        var name = name.replacingOccurrences(of: "^-(\\d)", with: "_negative$1", options: .regularExpression)
        name = name.lowerCamelCased()
        return escapeName(name)
    }

    func getEnumType(_ name: String) -> String {
        escapeType("\(modelPrefix ?? "")\(name.upperCamelCased())")
    }

    func getItemType(name _: String, item _: Item, checkEnum _: Bool = true) -> String {
        "UNKNOWN_ITEM_TYPE"
    }

    func getModelType(_ name: String) -> String {
        let type = name.upperCamelCased()
        return escapeType("\(modelPrefix ?? "")\(type)\(modelSuffix ?? "")")
    }

    func getSchemaType(name _: String, schema _: Schema, checkEnum _: Bool = true) -> String {
        "UNKNOWN_SCHEMA_TYPE"
    }

    // MARK: escaping

    func escapeName(_ name: String) -> String {
        let string = escapeString(name)
        return disallowedNames.contains(string) ? getEscapedName(string) : string
    }

    func escapeType(_ type: String) -> String {
        let string = escapeString(type)
        return disallowedTypes.contains(string) ? getEscapedType(string) : string
    }

    func getEscapedType(_ type: String) -> String {
        "_\(type)"
    }

    func getEscapedName(_ name: String) -> String {
        "_\(name)"
    }
}
