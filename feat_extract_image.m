function [Xfeat] = feat_extract_image(M, nbim_dim1, nbim_dim2)
%
%
%

[n1, n2] = size(M);

dim1 = floor(n1 / nbim_dim1);
dim2 = floor(n2 / nbim_dim2);
k=1;

for m = 1:nbim_dim1
    m1 = (m-1)*dim1 + 1;
    m2 = m * dim1;

    for p = 1:nbim_dim2
        p1 = (p-1)*dim2 + 1;
        p2 = p * dim2;

        M_mp = M(m1:m2, p1:p2);

        feat_mp = features_extract(M_mp);
        Xfeat(k,:) = feat_mp(:)';

        k = k+1;
    end
end



