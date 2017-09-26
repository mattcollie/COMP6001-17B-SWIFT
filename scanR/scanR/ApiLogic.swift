import Foundation

class ApiLogic {
    
    class var endpoint: String { return "" }

    typealias GetMethodHandler = (_: Data?, _: URLResponse?, _: Error?) -> Void

    private static func GetURL(type: String) -> URL {
        let url = URL(string: "http://mattc.cloudfast.co/api/" + type)!
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

    internal static func GetResult(response: @escaping GetMethodHandler) {
        GetRequest(response: response)
    }

    internal static func GetResult(id: Int64, response: @escaping GetMethodHandler) {
        GetRequest(extra: String(id), response: response)
    }
}

class StudentApi : ApiLogic {
    override class var endpoint: String { return "student" }

    typealias GetStudentMethod = (_: [Student]?, _: URLResponse?) -> Void
    public static func Get(response: @escaping GetStudentMethod) {
        GetResult(response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String] {
                print(json)
                let students: [Student] = []
                response(students, urlResponse)
            }
        })
    }
    
    typealias GetByStudentMethod = (_: Student?, _: URLResponse?) -> Void
    public static func GetByStudentId(id: Int64, response: @escaping GetByStudentMethod) {
        GetResult(id: id, response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String] {
                print(json)
                let student = Student(StudentId: 1, FirstName: "John", LastName: "Doe", BarcodeId: nil)
                response(student, urlResponse)
            }
        })
    }
    
    typealias GetByBarcodeMethod = (_: Student?, _: URLResponse?) -> Void
    public static func GetByBarcode(id: Int64, response: @escaping GetByBarcodeMethod) {
        GetRequest(extra: "barcode/" + String(id), response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String] {
                print(json)
                let student = Student(StudentId: 1, FirstName: "John", LastName: "Doe", BarcodeId: nil)
                response(student, urlResponse)
            }
        })
    }
}

class TimeslotApi : ApiLogic {
    override class var endpoint: String { return "timeslot" }

    typealias GetTimeslotsByStudentMethod = (_: [Timeslot]?, _: URLResponse?) -> Void
    public static func GetTimeslotsByStudentId(id: Int64, response: @escaping GetTimeslotsByStudentMethod) {
        GetResult(id: id, response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data),
                let json = rawJSON as? [String: String] {
                print(json)
                let timeslots: [Timeslot] = []
                response(timeslots, urlResponse)
            }
        })
    }
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
