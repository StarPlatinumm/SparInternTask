import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts() {
        guard let url = URL(string: "https://run.mocky.io/v3/1800dba6-6a9a-48e8-b420-c4f978b7b69a") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        self.products = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
