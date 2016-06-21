function Result = TestRCE(Nodes, Class, Rayons, X, Y ) 

[nbTest, nbFeat] = size(X) ;
Result = 0 ; 

for i = 1:nbTest
    DistNodes  = Calc_Distance( X(i,:), Nodes) ;
    Activ = DistNodes < Rayons ;
    
    if sum(Activ) == 0
        Pred = zeros(1,nbFeat) ;
        fprintf('= Rien d activé \n') ;
    else
        Pred = sum(Class(Activ,:)) > 0 ;
        fprintf('= Activation de %d noeud\n', sum( Activ )) ;
    end
    
    PredY1 = Y(i,:) .* Pred ;
    fprintf(' Tous à 1 (%d)\n', sum( PredY1 )) ;
    
    Pred_Inter_Y = sum( PredY1 )  ;
    Dice = 2 * Pred_Inter_Y / ( sum(Y(i,:)) + sum(Pred) ) ;
    
    Result = Result + Dice / nbTest ;
end
fprintf('- Result : %1.2f \n',100 *Result) ;

end