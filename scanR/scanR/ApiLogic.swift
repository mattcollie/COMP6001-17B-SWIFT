import Foundation

class ApiLogic {
    
    class var endpoint: String { return "" }

    typealias GetMethodHandler = (_: Any?, _: Any?, _: Any?) -> Void

    private static func GetURL(type: String) -> URL {
        let url = URL(string: "http://localhost:2344/api/" + type)!
        return url
    }

    internal static func GetRequest(response:  @escaping GetMethodHandler) {
        let url = GetURL(type: endpoint)
        let task = URLSession.shared.dataTask(with: url, completionHandler: response)
        task.resume()
    }

    internal static func GetRequest(extra: String, response: @escaping GetMethodHandler) {
        let url = GetURL(type: endpoint + "/" + extra)
        let task = URLSession.shared.dataTask(with: url, completionHandler: response)
        task.resume()
    }

    public static func Get(response: @escaping GetMethodHandler) {
        GetRequest(response: response)
    }

    public static func Get(id: Int64, response: @escaping GetMethodHandler) {
        GetRequest(extra: String(id), response: response)
    }
}

class StudentApi : ApiLogic {
    override class var endpoint: String { return "student" }

    public static func GetByBarcode(id: Int64, response: @escaping GetMethodHandler) {
        GetRequest(extra: "barcode/" + String(id), response: response)
    }
}

class TimeslotApi : ApiLogic {
    override class var endpoint: String { return "timeslot" }

}

struct Timeslot {
    var Id: Int64
    var Day: Int
    var Hour: Int
    var DurationMinutes: Int
    var ClassName: String
    var PaperName: String
    var ClassType: String
    var StudentId: Int64
}

struct Student {
    var StudentId: Int64
    var FirstName: String
    var LastName: String
    var BarcodeId: Int64?
}
