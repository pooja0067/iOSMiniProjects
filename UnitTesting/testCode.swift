import XCTest

class basicOperations2 {
func add(n1: Int, n2:Int) -> Int {
    return n1 + n2
}

func sub(n1: Int, n2:Int) -> Int {
    return n1 - n2
}

func dev(n1: Int, n2:Int) -> Int {
    return n1 / n2
}
func mul(n1: Int, n2:Int) -> Int {
    return n1 * n2
}
}


class operationsTest3: XCTestCase {
    
    var cut = basicOperations2()
    
    func ztestAdd() {
        let n1 = 20
        let n2 = 10
        
        let res = cut.add(n1: n1, n2: n2)
        print("res is==>")
        XCTAssertEqual(res, 30)
        
    }
    
}


