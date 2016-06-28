function [CenterBubble, AreaBubble] = CaracBubble(M)

    M = M/255;
    [n,m] = size(M) ;
    AreaBubble = sum(sum(M)) ;
    CenterBubble = [ (1:n)*sum(M,2)/sum(sum(M)) , sum(M,1)*(1:m)'/sum(sum(M)) ] ;

end