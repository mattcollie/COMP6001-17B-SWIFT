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
    
    internal static func HttpPost(jsonData: Data, response: @escaping GetMethodHandler) {
        if !jsonData.isEmpty {
            var request = URLRequest(url: GetURL(type: endpoint))
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request, completionHandler: response)
            task.resume()
        }
    }
}

class StudentApi : ApiLogic {
    override class var endpoint: String { return "student" }

    typealias GetByStudentMethod = (_: Student?, _: URLResponse?) -> Void
    public static func GetByStudentId(id: Int64, response: @escaping GetByStudentMethod) {
        GetResult(id: id, response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                var targetDict = [String: String]()
                for (key, value) in rawJSON! {
                    targetDict[key] = String(describing: value)
                }
                let student = Student(json: targetDict)
                response(student, urlResponse)
            }
        })
    }
    
    typealias GetByBarcodeMethod = (_: Student?, _: URLResponse?) -> Void
    public static func GetByBarcode(id: Int64, response: @escaping GetByBarcodeMethod) {
        GetRequest(extra: "barcode/" + String(id), response: {(data, urlResponse, error) -> Void in
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                var targetDict = [String: String]()
                for (key, value) in rawJSON! {
                    targetDict[key] = String(describing: value)
                }
                let student = Student(json: targetDict)
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
            var timeslots: [Timeslot] = []
            if let data = data,
                let rawJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                for case let result in rawJSON! {
                    var targetDict = [String: String]()
                    for (key, value) in result {
                        targetDict[key] = String(describing: value)
                    }
                    if let timeslot = Timeslot(json: targetDict) {
                        timeslots.append(timeslot)
                    }
                }
                response(timeslots, urlResponse)
            }
        })
    }
    
    public static func UpdateTimeslot(timeslot: Timeslot) {
        HttpPost(jsonData: timeslot.toJSON()!, response: {(data, urlResponse, error) -> Void in
            print(data)
            print(urlResponse)
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
    
    init?(json: [String: String]) {
        guard let id = Int64(json["Id"]!),
            let day = Int(json["Day"]!),
            let hour = Int(json["Hour"]!),
            let durationminutes = Int(json["DurationMinutes"]!),
            let className = json["ClassName"],
            let paperName = json["PaperName"],
            let classType = json["ClassType"],
            let studentId = Int64(json["StudentId"]!) else { return nil }
        
        Id = id
        Day = day
        Hour = hour
        DurationMinutes = durationminutes
        ClassName = className
        PaperName = paperName
        ClassType = classType
        StudentId = studentId
    }
        
    
    func toJSON() -> Data? {
        let props: [String: Any?] = [
            "Id": Id,
            "Day": Day,
            "Hour": Hour,
            "DurationMinutes": DurationMinutes,
            "ClassName": ClassName,
            "PaperName": PaperName,
            "ClassType": ClassType,
            "StudentId": StudentId
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: props, options: .prettyPrinted)
            return jsonData
        } catch let error {
            print("error converting to json: \(error)")
            return nil
        }
    }
}

struct Student {
    var StudentId: Int64
    var FirstName: String
    var LastName: String
    var BarcodeId: Int64?
    
    init?(json: [String: String]) {
        guard let studentId = Int64(json["StudentId"]!),
            let firstName = json["FirstName"],
            let lastName = json["LastName"],
            let barcodeId = Int64((json["BarcodeId"])!) else { return nil }
        
        StudentId = studentId
        FirstName = firstName
        LastName = lastName
        BarcodeId = barcodeId
    }
    init(barcode: Int64) {
        StudentId = 0
        FirstName = ""
        LastName = ""
        BarcodeId = barcode
    }
}
