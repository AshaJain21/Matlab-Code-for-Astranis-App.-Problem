function [output] = finder(input, islandSize, threshold)

[rows, cols] = size(input);

%The first step is to stop considering any values in the matrix that are
%below the threshold since they cannot be members of an island. To remove
%tese digits from consideration, I replace their value with false, or logical 0. 
   input = input>=threshold;

%If all the values in the matrix were below the threshold, there is no need
%to continue evaluating, so return an output of all false. 
    if(all(input==false))
       output = input;
       return
    end
%Now, we can be sure that our matrix has at least one value above the
%threshold. If the island size is equal to 1, then we have a special case
%and should set all values above the threshold to true and return. 
    if(islandSize==1)
        input=input~=0;
        output = input;
        return
    else
%In the case that we have an islandSize greater than 1 and at least 1 digit
%above the threshold, then we can find the location (rows and cols) of each
%digit above the threshold. I store these locations of these digits in possibleLocations. 
         [locRows, locCols] = find(input);
         possibleLocations = [locRows,locCols];
         
%Now we have to condsider the case that there may be muliple independent
%islands. Some of those islands may not meet the minimum island size, and
%should removed from consideration. To do this, I look at the each possible island location
%(which is stored in possibleLocations) and save the locations of its 
%neighbors that are above the threshold in newLocations. 
        storedLocations = [];
         for index = 1:size(possibleLocations)
            if(size(storedLocations) ==0)
                storedLocations = possibleLocations(index,:);
            end
            newLocations = findNeighbors(possibleLocations(index, 1), possibleLocations(index, 2), input);
             
            %An island will be separeted will eventually generate the same
            %list of compartible neighbors, so to detect an island, we need
            %to understand if we have already saved the values in
            %newLocations in storedLocations. If there are no new
            %locations compared the the stored locations, then we must be
            %at the end of the island. If there are new locations, then I
            %add those new locations to the stored locations and iterate
            %the for loop to the next possible island member location.
            newLocations = doesAExistInB(newLocations, storedLocations);
            
            if(size(newLocations) ~=0)
                storedLocations = newLocations;
            else
             %If we reach the end of an island, then we need to check if
             %the number of members in the island meets the minimum island
             %size. If there aren't enough members, then we should stop
             %considering those locations because they do not create an
             %island. Therefore, I check to see if the size of
             %storedLocations is less than the islandSize and delete the
             %storedLocations if it is true. 
                [storedLocRows, ~] = size(storedLocations);
                if(storedLocRows < islandSize)
                    storedLocations = [];
                end
            end
         end
         
         %It is possible that all the possible island members that we found
         %did not have enough neighbors to consitute an island, so I put a
         %check here to ensure that we have island locations stored.
         %Otherwise, we set all members to false. 
         if(size(storedLocations)>0)
             locations = table(storedLocations(:,1), storedLocations(:,2));
             uniqueLocs = unique(locations);
             uniqueLocs = table2array(uniqueLocs);
            
             %After removing any duplicate locations from the stored
             %locations, adjust the output to reflect the locations of the
             %island members by setting their value to true.
             output = adjustOutput(uniqueLocs, rows, cols);              
         else
             output = false(rows,cols);
         end
    end
end

