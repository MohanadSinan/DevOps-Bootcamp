// Predict 2: If we needed to send a birth year to the function, we would tell the function
//  "hey, we're gonna send you a variable called birthYearInput."
//  We do that by adding the variable name into the parentheses. See below for an example. 
//  So, if the variable birthYearInput is 1980 (aka var birthYearInput = 1980),
//  and this function is called, what would the console.log state?

function myBirthYearFunc(birthYearInput){
    console.log("I was born in " + birthYearInput); // I was born in 1980
}
myBirthYearFunc(1980)
