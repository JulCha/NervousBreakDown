
function Dist = Calc_Distance( In, Nodes, Activ)
% Calcul de la distance entre l'entrée In et chaque noeud de Nodes

[NbNodes , NbFeat ] = size(Nodes) ;

if ~exist('Activ', 'var') || isempty(Activ) 
	Activ = ones(NbNodes,1);
end

Dist = zeros(NbNodes,1) ;



for i = 1:NbNodes 
    if Activ(i)
        Dist(i) = ( Nodes(i,:) - In ) * ( Nodes(i,:) - In )'  / NbFeat ;
    end
end

end