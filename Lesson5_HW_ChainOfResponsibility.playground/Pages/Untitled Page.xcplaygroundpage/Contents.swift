import UIKit
import Foundation

func data(from file: String) -> Data {
    let path1 = Bundle.main.path(forResource: file, ofType: "json")!
    let url = URL(fileURLWithPath: path1)
    let data = try! Data(contentsOf: url)
    return data
}

let data1 = data(from: "1")
let data2 = data(from: "2")
let data3 = data(from: "3")

protocol Union {}

struct FirstJsonData: Codable, Union {
    var data: [People]
}

struct People: Codable, Union {
    var name: String
    var age: Int
    var isDeveloper: Bool
}

struct SecondJsonResult: Codable, Union {
    var result: [People]
}

protocol ChainOfResponsibility {
    var next: ChainOfResponsibility? { get set }
    func handingData(_ data: Data)
}

class FirstExample: ChainOfResponsibility {
    var next: ChainOfResponsibility?

    func handingData(_ data: Data) {
        let decoder = JSONDecoder()
        var result: FirstJsonData?
        do {
            result = try decoder.decode(FirstJsonData.self, from: data)
        } catch {
            print("invalid data")
            self.next?.handingData(data)
            return
        }
        result?.data.forEach { print("\($0.name) \($0.age) \($0.isDeveloper)")}
    }
}


class SecondExample: ChainOfResponsibility {
    var next: ChainOfResponsibility?

    func handingData(_ data: Data) {
        let decoder = JSONDecoder()
        var result: SecondJsonResult?

        do {
            result = try decoder.decode(SecondJsonResult.self, from: data)
        } catch {
            print("invalid data")
            self.next?.handingData(data)
            return
        }
        result?.result.forEach { print("\($0.name) \($0.age) \($0.isDeveloper)")}
    }
}


class ThirdExample: ChainOfResponsibility {
    var next: ChainOfResponsibility?

    func handingData(_ data: Data) {
        let decoder = JSONDecoder()
        var result: [People]?

        do {
            result = try decoder.decode([People].self, from: data)
        } catch {
            print("invalid data")
            self.next?.handingData(data)
            return
        }
        result?.forEach { print("\($0.name) \($0.age) \($0.isDeveloper)")}
    }
}

let firstExample = FirstExample()
let secondExample = SecondExample()
let thirdExample = ThirdExample()

firstExample.next = secondExample
secondExample.next = thirdExample
thirdExample.next = nil

firstExample.handingData(data3)
