function [Indexes, CenterRect, CenterBubble, AreaRect, AreaBubble ] = CropAllMasks(dirName)
dirData = dir(dirName) ; 
fileList = char({dirData(4:end).name}) ; % Les 1ers étant '.' '..' et '.DS_Store'

n = size(fileList,1) ;
Indexes = zeros(n,4) ;
CenterRect = zeros(n,2) ;
CenterBubble = zeros(n,2) ;
AreaRect = zeros(n,1) ;
AreaBubble = zeros(n,1) ;

for i = 1:n
    Path = strcat(dirName, '/',fileList(i,:) );
    rawData = importdata(Path);
    Index = CropMask(rawData);
    if ~isempty(Index)
        Indexes(i,:)      = Index;
        CenterRect(i,:)   = [mean(Index(1:2)) , mean(Index(3:4)) ];
        AreaRect(i,:)     = (Index(2)-Index(1))*(Index(4)-Index(3));
        eta = 0.45;
        x1bis = Index(1) + floor((Index(2) - Index(1)) * eta) ;
        x2bis = Index(2) - floor((Index(2) - Index(1)) * eta) ;
        y1bis = Index(3) + floor((Index(4) - Index(3)) * eta) ;
        y2bis = Index(4) - floor((Index(4) - Index(3)) * eta) ;
        [center, area]    = CaracBubble(rawData(x1bis:x2bis,y1bis:y2bis));
        CenterBubble(i,:) = [x1bis-1,y1bis-1] + center;
        AreaBubble(i,:)   = area;
    end
end


end