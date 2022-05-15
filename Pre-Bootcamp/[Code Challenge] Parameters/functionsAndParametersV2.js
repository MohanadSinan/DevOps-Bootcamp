function greet(name) {
    const d = new Date();
    let time = d.toLocaleTimeString();  // Learned from w3schools.com
    console.log("Good day, ", name);
    console.log("The time is: ", time);
}
greet("Muhannad")