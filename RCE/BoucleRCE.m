
function [Rebelotte, Nodes, Class, Rayons] = BoucleRCE( In, Out, ...
                                    Nodes, Class, Rayons, Rmax, Prox_max)

DistNodes  = Calc_Distance( In, Nodes) ;
Activ = DistNodes < Rayons ;

if sum(Activ) == 0
    %% l'element n'active rien, on le rajoute dans les noeuds.
    fprintf('- - - Un noeud rajouté (%d)\n',size(Nodes,1)+1) ;
    
    DistTarget = 100 * Calc_Distance( Out, Class ) ;

    %fprintf('DistTarget  (non activé) (%d)\n',DistTarget) ;

    ClassDifferent = DistTarget > Prox_max ;
    if size(ClassDifferent) == 0 
        r = Rmax ;
    else
        r = max(Rmax,min(DistNodes(ClassDifferent,:))) ;
    end
        
    Nodes = [Nodes ; In ] ;
    Class = [Class ; Out ] ;
    Rayons = [Rayons ; r ] ;
    
    Rebelotte = 0 ;
    
else
    % l'element active des noeuds
    DistTarget = 100 * Calc_Distance( Out, Class, Activ ) ;

    [ DistMax , NodeNo ] = max(DistTarget);
    
    %fprintf('DistTarget     ( activé) (%d)\n',DistMax) ;
    
    if DistMax > Prox_max ;
        % Il active des noeuds trop distants du target
        Rayons(NodeNo,1) = max(0, DistNodes(NodeNo)*0.5 ) ;
        Rebelotte = 1 ;
        fprintf('- - - Rayon diminué \n') ;

    else
        %Il active que des noeuds proches du target. impec
        Rebelotte = 0 ; 
    end

end