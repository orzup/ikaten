class Rules : DataCollection {
    override init() {
        super.init()
    }

    override init(let _ params: Array<Dictionary<String, AnyObject>>) {
        super.init()
        for param in params {
            append(Rule(param))
        }
    }

    override init(let _ data: Array<Data>){
        super.init()
        for datum in data {
            append(datum)
        }
    }

    func gachi() -> Rules {
        let rules = self
        rules.removeAtIndex(rules.find("nawabari")!)

        return rules
    }
}
