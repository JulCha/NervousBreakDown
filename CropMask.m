function [Indexes] = CropMask(R)

% Recherche des indices mini pour lesquels on voit une tache
[m,ind_cols] = max(R,[],2);
y1 = min(ind_cols(ind_cols>1));
[m,ind_rows] = max(R,[],1);
x1 = min(ind_rows(ind_rows>1));

% Recherche des indices maxi pour lesquels on voit une tache
Rud = flipud(R);
Rlr = fliplr(R);
[m,ind_cols] = max(Rud,[],1);
x2 = (size(R,1)+1)-min(ind_cols(ind_cols>1));
[m,ind_rows] = max(Rlr,[],2);
y2 = (size(R,2)+1)-min(ind_rows(ind_rows>1));

Indexes = [x1,x2,y1,y2] ;
%R_rogne = R( x1:x2 , y1:y2 ) ;
%figure
%subplot(1,2,1)
%imagesc(R)
%subplot(1,2,2)
%imagesc(R_rogne)

end