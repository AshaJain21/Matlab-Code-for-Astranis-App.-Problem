function [validatedLocations] = doesAExistInB(newLocations, storedLocations)
    
    combinedLocations = [storedLocations;newLocations];
    [storedRows, ~] = size(storedLocations);

    locations = table(combinedLocations(:,1), combinedLocations(:,2));
    uniqueLocs = unique(locations);
    uniqueLocs = table2array(uniqueLocs);
    
    [uniqueRows, ~] = size(uniqueLocs);
    
    if(uniqueRows == storedRows)
        validatedLocations = [];
    else
        validatedLocations = uniqueLocs;
    end

end