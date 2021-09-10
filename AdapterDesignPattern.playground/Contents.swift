import Foundation
import PlaygroundSupport

protocol BeanGrinder {
  func grindBeans()
}

struct MrCoffee: BeanGrinder {
  func grindBeans() {
    print("MrCoffee is grinding the beans.")
  }
}

struct Brevelle: BeanGrinder {
  func grindBeans() {
    print("The Brevelle is now grinding some espresso beans.")
  }
}

struct Keurig: BeanGrinder {
  func grindBeans() {
    print("I'm sorry a Keurig doesn't grind beans.")
  }
}

struct CoffeeMaker {
  func grindMyBeans(coffeeMakers: [BeanGrinder]) {
    makers.map { $0.grindBeans() }
  }
}

///  Adaptor for the blackbox
extension BlackBox: BeanGrinder {
  func grindBeans() {
    grindMyBeans()
  }
}

struct BlackBoxAdaptor: BeanGrinder {
    func grindBeans() {
        BlackBox().grindMyBeans()
    }
}

let makers: [BeanGrinder] = [MrCoffee(), Keurig(), Brevelle(), BlackBoxAdaptor()]

CoffeeMaker().grindMyBeans(coffeeMakers: makers)
