
function calculateAverage(grades)
    local sum = 0 -- Variable to store the sum of grades
    
    -- Loop through each grade in the table
    for i = 1, #grades do
      sum = sum + grades[i] 
    end
    
    local average = sum / #grades -- Calculate the average by dividing the sum by the number of grades
    return average 
  end
  
  local studentGrades = {78, 92, 85, 88, 90}
  
  -- Call the calculateAverage function and pass in the studentGrades table
  local averageGrade = calculateAverage(studentGrades)
  
  -- Print the average grade
  print("The average grade is: " .. averageGrade)