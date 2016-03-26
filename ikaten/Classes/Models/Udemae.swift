class Udemae {
    static let ranks = [
        "C-", "C", "C+",
        "B-", "B", "B+",
        "A-", "A", "A+",
        "S", "S+"
    ]

    static let expsMin = 0
    static let expsMax = 100

    class func exps() -> Array<Int> {
        var array: Array<Int> = []
        for i in expsMin ..< expsMax {
            array.append(i)
        }
        return array
    }
}
