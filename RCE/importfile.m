function [X, l,h] = importfile(dirName, n)

if ~exist('n', 'var') || isempty(n) 
	n = size(fileList,1) ;
end

dirData = dir(dirName) ; 
fileList = char({dirData(4:end).name}) ; % Les 1ers étant '.' '..' et '.DS_Store'

% Initialisation avec le 1er fichier
Path = strcat(dirName, '/',fileList(1,:) );
rawData = importdata(Path);
[l,h] = size(rawData) ;

X = zeros(n,l*h) ;
X(1,:) = rawData(:)' ;

for i = 2:n 
    Path = strcat(dirName, '/',fileList(i,:) );
    rawData = importdata(Path);
    X(i,:) = rawData(:)' ;
end

