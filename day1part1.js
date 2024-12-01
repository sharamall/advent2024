const fs = require('node:fs');

const lines = fs.readFileSync('day1in.txt', 'utf8')

let a  = []
let b = []

lines.split("\n").forEach(function (line) {
    let nums = line.split(" ").filter(i => i !== '').map(i => parseInt(i))
    let first = nums[0]
    let second = nums[1]
    a.push(first)
    b.push(second)
})
a.sort()
b.sort()
let dist = 0
a.forEach(function (arg, i) {
    dist += Math.abs(b[i] - arg)
})
console.log(dist)