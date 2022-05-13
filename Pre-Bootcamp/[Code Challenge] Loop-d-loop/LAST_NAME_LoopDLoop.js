// Q: How do we know we need a loop here
// A: Because the device will pop out a piece of candy every time a runner reaches 2 miles until mile 6.

// Q: What's the starting point of the loop?
// A: When the runner reaches two miles.

// Q: When should the loop stop?
// A: When the runner reaches six miles.

// Q: How will it know to stop?
// A: If the miles equal six.

// Q: What's the incrementing for each iteration of the loop?
// A: It should add two for each iteration.

// Q: What variables do we need?
// A: We only need one variable.

for (var mile = 0; mile < 6; mile = mile + 2) {
    console.log("Candy");
}

// Stretch Feature 1
var mile = 0;
var speed;
while (speed > 5.5) {
    console.log("Candy");
    mile = mile + 2;
}