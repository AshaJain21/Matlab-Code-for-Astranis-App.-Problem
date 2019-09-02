clear;
clc;

islandSize = 2
threshold = 5

%Given test set
input1 = [4, 4, 4, 2, 2; 4, 2, 2, 2, 2; 2, 2, 8, 7, 2; 2, 8, 8, 8, 2; 8, 2, 2, 2, 8]
output1 = finder(input1, islandSize, threshold)

%Tests if the algo can handle multiple possible island locations that are too small
%to form a real island. Should turn these potential island locations that
%are too small to false, while reflecting the islands that are large enough. 
input2 =  [8,0,0,0;0,8,0,8;0,8,0,0;8,0,8,0]
output2 = finder(input2, islandSize, threshold)

%Tests if the algo can handle the case of mulitple possible island
%locations and no island being large enough. All values should be false. 
input3 =[8,0,0,0;0,8,0,8;0,0,0,0;8,0,8,0]
output3 = finder(input3, islandSize, threshold)

%Tests if the algo can handle island locations that are close to the
%minimum size for an island, and but are still too small. This check makes
%sure that there is no accidental carry over when measuring the size of the
%potential island
disp("Change of Island Size")
islandSize = 3
input4 = [8,8,2,3,4;2,1,8,8,8;2,3,8,8,8]
output4 = finder(input4, islandSize, threshold)

%Tests if the algo can detect that there are both repeated locations and
%new values to add to stored locations. This check ensures that the independent island
%detection part of the algo does not miss links between neighbors. 
input5 = [8,8,8,3,4;2,1,8,8,8;2,3,8,8,8]
output5 = finder(input5, islandSize, threshold)

%Tests if the algo still performs correctly even if the first number in the
%matrix is above the threshold, but not a part of an island. 
input6 =  [8,0,0,0;0,8,8,8;0,8,0,0;8,8,8,0]
output6 = finder(input6, islandSize, threshold)


disp("Change of Island Size")
islandSize = 1

%Tests the special case where the island size is 1
input7 = [4,5;6,2]
output7 = finder(input7, islandSize, threshold)

%Tests whether the algo catches the case where all values are below the
%threshold
input8 = [2,2,2,2]
output8 = finder(input8, islandSize, threshold)


