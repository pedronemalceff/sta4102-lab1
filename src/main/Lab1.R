## STA4102 Lab 

# Question 1

# Part(a)
# Convert this program into an R program. When you are done with part a you should have a data frame

# Create a data frame
bodymass <- data.frame(
  Gender = 'Male',
  Weight = 150,
  Height = 68
)

# Part(b)
# Use the summary function on your data. What does it tell you?

summary(bodymass)

# The summary function tells me the length, class, and mode of the data frame. 
# It also gives me stats on the weight and height variables, such as min, 1Q, median, mean, 3Q, and max.

# Part(c)
# Are they all numeric, character, or a mix? What should it be and how can you correct it if it is all character?

# It is a mix. Gender is a character and weight and height are numeric. You can correct it if it is all charcater by using the as.numeric function on the desired data.

# Part(d)
# Choose different values for the variables Weight and Height in your program. Print your updated BMI.

# Create a data frame
bodymass <- data.frame(
  Gender = 'Male',
  Weight = 169,  # New Weight value
  Height = 72   # New Height value
)

# Calculate BMI
bodymass$BMI <- (bodymass$Weight / (bodymass$Height ^ 2)) * 703

# Display the updated data frame
print(bodymass$BMI)


# Question 2
# Read the Diaper.txt file into R. 

# Replace 'your_file.txt' with the actual file path
diapers <- read.table("C:/Users/Pedro Nemalceff/Downloads/Diapers-1.txt", sep = "\t", header = FALSE, stringsAsFactors = FALSE, quote = "")

# Part(a)
# Give variable names for the Brand, Quantity, and Amount.

# Extract and rename the columns
diapers$Brand <- sub("([[:alpha:][:punct:][:space:]]+).*", "\\1", diapers$V1)
diapers$Quantity <- as.numeric(gsub(".*?(\\d+) .*", "\\1", diapers$V1))
diapers$Amount <- as.numeric(gsub(".*\\$(.*)", "\\1", diapers$V1))

# Remove the original "V1" column
diapers <- diapers[, c("Brand", "Quantity", "Amount")]

head(diapers)

# Part(b)
# Find the average quantity purchased

# Calculate the average quantity purchased
average_quantity <- mean(diapers$Quantity)

# Print the result
cat("Average Quantity Purchased:", average_quantity, "\n")


