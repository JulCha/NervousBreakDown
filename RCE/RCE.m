function [Nodes, Class, Rayons] = RCE(X, Y, Rmax, Prox_max)
% Reduced Coulomb Energy Algo.

%% Initialisation 
N = size(X,1);

Nodes  = X(1,:) ;
Class  = Y(1,:) ;
Rayons = [Rmax];

Bouclage = 1 ;
ind = 2 ;

%% On Applique une nouvelle entrée In = train_features(ind,:)
fprintf('- - RCE Bouclage\n') ;

while ( Bouclage == 1 )

   In  = X(ind,:) ;
   Out = Y(ind,:) ;

   [Rebelotte, Nodes, Class, Rayons] = BoucleRCE( In, Out, ...
                                    Nodes, Class, Rayons, Rmax, Prox_max) ;
                 
    if Rebelotte 
        ind = 1 ;
        fprintf('- - On reprend à zero \n') ;

    else
        if ind == N 
            Bouclage = 0 ;
            fprintf('- - RCE Terminé !!\n') ;
        else
            ind = ind + 1 ;
            fprintf('- - Indice suivant (%d)\n', ind) ;
        end
    end
end

end
