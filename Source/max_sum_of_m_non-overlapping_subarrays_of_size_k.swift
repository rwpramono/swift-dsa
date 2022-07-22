import Foundation

// Calculate Presum Array
func presumArray(presum: inout [Int], arr: [Int], k: Int) {
    for i in 0..<k {
        presum[0] += arr[i]
    }
 
    for i in 1...arr.count - k {
        presum[i] += presum[i - 1] + arr[i + k - 1] - arr[i - 1]
    }
}
 
// Max Sum M non Overlapping Subarray 
func maxSum(presum: [Int], m: Int, size: Int, k: Int, start: Int) -> Int {
  if m == 0 || start > size - 1 {
    return 0
  }

  let includeMax: Int = presum[start] + maxSum(presum: presum, m: m - 1, size: size, k: k, start: start + k)
 
  let excludeMax: Int = maxSum(presum: presum, m: m, size: size, k: k, start: start + 1)
    
  return max(includeMax, excludeMax)
}

func getMax(arr: [Int], size: Int, k: Int) -> Int {
    var presum: [Int] = Array(repeating: 0, count: arr.count + 1 - k)
    presumArray(presum: &presum, arr: arr, k: k)
    return maxSum(presum: presum, m: size, size: arr.count + 1 - k, k: k, start: 0)
}

let xSize = 1
let ySize = 1
let zSize = 1
let a = [1,2,3,4,5]

// Get em all problems
let x = getMax(arr: a, size: 1, k: xSize)
let y = getMax(arr: a, size: 2, k: ySize)
let z = getMax(arr: a, size: 3, k: zSize)
print(x+y+z)