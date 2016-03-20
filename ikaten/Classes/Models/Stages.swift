class Stages {
    var names: Array<Stage> = []

    init(let data: Dictionary<String, AnyObject>) {
        for name in data["maps"] as! Array<String> {
            names.append(Stage(name))
        }
    }

    func firstStage() -> Stage {
        return names.first!
    }

    func secondStage() -> Stage {
        return names[1]
    }

    func thirdStage() -> Stage {
        return names[2]
    }

    func stageAtIndex(let index : Int) -> Stage {
        return names[index]
    }
}
