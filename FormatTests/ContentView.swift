import SwiftUI

struct ContentView: View {
  @State var data = [String]()

  var body: some View {
    NavigationSplitView(
      sidebar: {
        List(data, id: \.self) { row in
          Text(row)
        }
      },
      detail: {
        Text(someComputedProperty)
      }
    )
    .onAppear(perform: createTestData)
  }

  func createTestData() {
    data = Array(0..<1000).map { "Row #\($0)" }

  }

  func downloadData() {
    let address = "https://zenquotes.io/api/quotes"
    let url = URL(string: address)!
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in

      if let data = data, let string = String(data: data, encoding: .utf8) {
        print(string)
      }
    }

    task.resume()
  }

  var someComputedProperty: String {
    """
    This is a multiline string,
    that is a computed property which can be tricky to format.

    It has nothing to do with the list on the side, but I wanted to see how swift-format would handle it.
    """
  }

  func longFunctionNameThatDoesSomething() {
    print("This is a long function name that does something")
    FunctionwithLotsOfArguments(
      arg1: 1, arg2: 2, arg3: 3, arg4: 4, arg5: 5, arg6: 6, arg7: 7, arg8: 8, arg9: 9, arg10: 10)
  }

  // Yes, this deliberately starts with an uppercase letter
  func FunctionwithLotsOfArguments(
    arg1: Int, arg2: Int, arg3: Int, arg4: Int, arg5: Int, arg6: Int, arg7: Int, arg8: Int,
    arg9: Int, arg10: Int
  ) {
    print("This is a function with a lot of arguments")
  }
}

#Preview {
  ContentView()
}
