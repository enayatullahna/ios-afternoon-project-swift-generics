struct CountedSet<Element: Hashable> {
    
    var elements: [Element: Int] = [:]
    
    // count
    var count: Int {
        return elements.count
    }
    
    //empty
    var isEmpty: Bool {
        return self.count == 0 ? true : false
    }
    
    //insert
    mutating func  insert(_ element: Element) {
        elements[element, default: 0] += 1
    }
    
    // remove
    mutating func remove(_ element: Element) -> Int {
        guard let counts = elements[element] else { return 0 }
        if counts == 0 {
            elements.removeValue(forKey: element)
        } else {
            self.elements[element] = counts - 1
        }
        
        return self.elements[element]!
    }
   
    // contains in the array
    func contains(_ element: Element) -> Bool {
        guard let items = self.elements[element] else { return false }
        return items > 0
    }
    
    //
    subscript(_ element: Element) -> Int {
        return self.elements[element] ?? 0
    }
    
}

// count set extntion
extension CountedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.init()
        for element in arrayLiteral {
            self.insert(element)
        }
    }
}

enum Arrow { case iron, wooden, elven, dwarvish, magic, silver }
var aCountedSet = CountedSet<Arrow>()
aCountedSet[.iron] // 0
var myCountedSet: CountedSet<Arrow> = [.iron, .magic, .iron, .silver, .iron, .iron]
myCountedSet[.iron] // 4
myCountedSet.remove(.iron) // 3
myCountedSet.remove(.dwarvish) // 0
myCountedSet.remove(.magic) // 0
