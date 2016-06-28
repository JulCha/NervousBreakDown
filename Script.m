clear
close all
clc

dirName = 'train/Masks';
[Indexes, CenterRect, CenterBubble, AreaRect, AreaBubble ] = CropAllMasks(dirName) ;

iCenterRect = CenterRect(:,1) > 0;
iCenterBubble = CenterBubble(:,1) > 0;
figure,
hold on
plot(CenterRect(iCenterRect,1),CenterRect(iCenterRect,2),'+k')
plot(CenterBubble(iCenterBubble,1),CenterBubble(iCenterBubble,2),'ob')
hold off
%%
figure
subplot(1,3,1)
hist(AreaRect,100)
subplot(1,3,2)
hist(AreaBubble,100)
subplot(1,3,3)
hist(AreaRect./AreaBubble,100)

%%
M = imread('train/1_1','tif');
%R = imread('train/1_1_mask','tif');

tic
[X,l,h] = importfile('train/Masks',2000);
MeanMasks = mean(X,1);
MeanMasks = reshape(MeanMasks,size(M));
toc
figure
surf(MeanMasks,'EdgeColor','none')






%%

[n1,n2] = size(M);

% TF de l'image
Mmean = M - mean(mean(M)) ;

TFM_init = Tfm( M );
TFM_init2 = Tfm( Mmean );

figure
subplot(1,2,1)
imagesc(TFM_init)
subplot(1,2,2)
imagesc(TFM_init2)


% Traitement du masque
R = R./max(max(R));

TFM_masque = Tfm(M.*R);

%imagesc(TFM_masque)



% comparaison HG/HD
TFM_HG = Tfm( M( 1:floor(n1/2) , 1:floor(n2/2) ) );
TFM_HD = Tfm ( M(1:floor(n1/2) , (floor(n2/2)+1):end) ) ;

figure
subplot(1,2,1)
imagesc(TFM_HG)
subplot(1,2,2)
imagesc(TFM_HD)



X = abs(fft2(M)) ;
PasseBas = zeros(size(X)) ;

mean = mean(mean(X)) ;

PasseBas(X<mean) = X(X<mean) ;
PasseBas = 255 * PasseBas ./ max(max(PasseBas)) ;
PasseTout = 255 * X ./ max(max(X)) ;

figure
subplot(1,2,1)
imagesc(DecalageQuarts(PasseTout))
subplot(1,2,2)
imagesc(DecalageQuarts(PasseBas)) ;


