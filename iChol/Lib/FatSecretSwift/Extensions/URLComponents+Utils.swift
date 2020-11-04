import Foundation

internal extension URLComponents {
    /**
    Creates URLQueryItems for URLComponent.
     Used for HTTP request.
     */
    mutating func componentsForURL(from array: [(key: String, value: String)]) {
        var queryItems = [URLQueryItem]()

        for tuple in array {
            queryItems.append(URLQueryItem(name: tuple.key, value: tuple.value))
        }

        self.queryItems = queryItems
    }

    /**
    Creates URLQueryItems for URLComponent.
     Used for OAuth Signature.
     */
    mutating func componentsForOAuthSignature(from array: [(key: String, value: String)]) {
        var queryItems = [URLQueryItem]()

        for tuple in array {
            let key = tuple.key
            var value = tuple.value

            if key == "search_expression" {
                value = value.replaceReservedCharacters()
            }

            queryItems.append(URLQueryItem(name: key, value: value))
        }

        self.queryItems = queryItems
    }

    /**
    Returns the url parameters concatenated together.
     Parameters are seperated by '&'.
     */
    func getURLParameters() -> String {
        let queryItems = self.queryItems!
        var params = ""

        for item in queryItems {
            let index = queryItems.firstIndex(of: item)

            if index != queryItems.endIndex - 1 {
                params.append(String(describing: "\(item)&"))
            } else {
                params.append(String(describing: item))
            }
        }

        return params
    }
}
