# Analysis of abalone.csv
# We want to predict how much an abalone (a type of shellfish like oysters)
# would weight after being prepared for consumption (shucked weight). This
# could be a predictor of how much it would be worth on the market. Since we do
# not want to have to open it (and thus kill it) to make our prediction, we can
# only use its physical dimensions (length, diameter, height, weight, rings)

# Load data ####
abalone = read.table("abalone.csv", header=T, sep=",")

# Look at data informations ####
print(names(abalone))
print(str(abalone))
print(head(abalone))

# Plot infos about interesting variables ####
plot(abalone[1:200, c("ShuckedWeight", "Length", "Diameter", "Height", "WholeWeight")])

# Create linear model ####
# Try to explain the Shucked Weight (weight of the part that is eaten) with
# physical dimensions
abalone$Length = abalone$Length^3
abalone$Diameter = abalone$Diameter^3
abalone$Height = abalone$Height^3
model = lm(abalone$ShuckedWeight ~ abalone$Length + abalone$Diameter + abalone$Height + abalone$Rings)
print(summary(model))

# Visualize prediction ####
plot(predict(model, data=abalone), abalone$ShuckedWeight, pch=19, col="#00000022", ylim=c(0, 1.5), xlim=c(0, 1.5))

# Add 1:1 line
abline(0, 1, col="red")
