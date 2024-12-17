func myFunc(param: String) -> Result<String, Error> {
    guard let url = URL(string: param) else {
        return .failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil))
    }
    do {
        let contents = try String(contentsOf: url)
        return .success(contents)
    } catch {
        print("Error loading URL: "
              + error.localizedDescription)
        return .failure(error)
    }
}

// Example usage with improved error handling:
let result = myFunc(param: "https://www.example.com")
switch result {
case .success(let content):
    print("Content:", content)
case .failure(let error):
    print("Error:", error.localizedDescription)
} 