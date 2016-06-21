%% Initialization
clear ; close all; clc

load('Data1000.mat');
%X = X > 100 ;
%Y = Y > 0 ;

%Combien on en charge ?
n = 1000 ;

%[X, ~, haut]  = importfile('../trainX',n) ;
%Y          = importfile('../trainY',n) ;
%Y = Y > 0 ;


%% Affichage, pour le style
% displayData(X,haut);
% 
% fprintf('Pause - Affichage des X\n') ;
% pause ;
% 
% A = X .* Y ;
% displayData(Y,haut);
% 
% fprintf('Pause - Affichage des Y\n') ;
% pause ;
% 


%% RCE Powa
Rmax = 10000000 ;
Prox_max = 3 ;

% Pourcentage Test - Train ?
NbTrain = 200 ;  

rand_indices = randperm(n);
Xrand = X(rand_indices(1:NbTrain), :);
Yrand = Y(rand_indices(1:NbTrain), :);



fprintf('- RCE powaaaa\n') ;

[Nodes, Class, Rayons] = RCE(Xrand, Yrand, Rmax, Prox_max) ;

% displayData(Nodes,haut);
% 
% fprintf('Pause - Affichage des Noeuds\n') ;
% pause ;
% 
% displayData(Class,haut);
% 
% fprintf('Pause - Affichage des Classes\n') ;
% pause ;
% 

Result = TestRCE(Nodes, Class, Rayons, X, Y ) ;
