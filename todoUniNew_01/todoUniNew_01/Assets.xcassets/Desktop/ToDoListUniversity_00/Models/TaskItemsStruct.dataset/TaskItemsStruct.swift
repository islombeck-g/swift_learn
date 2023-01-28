
import Foundation


struct TodoItem: Identifiable, Decodable, Encodable {
    var id =  UUID()
    var name: String
    var dateOfCreation: Date
}
