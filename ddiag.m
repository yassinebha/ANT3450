function [] = ddiag(temps,essai,epsilon)
% Affiche un diagramme de dispersion de temps de decharge
% Syntaxe: [] = ddiag(temps_u,essai_u)
%
% Entrees:
%   temps_u (vecteur) temps(t) est un temps correspondant a une decharge t.
%   essai_u   (vecteur) essai(t) est le numro de l'essai correspondant a la decharge t. 
%      Les essais doivent etre numerotes de 1 a N.
%
% Sortie: 
%   Un diagramme de dispersion des decharges, qui s'affiche sur la figure courante. 
% 
% Note: 
%   des pics separes d'un temps inferieur a epsilon = 0.01 sec seront 
%   comptabilises comme un seul pic. 
%   Le parametre epsilon peut etre modifie a l'aide d'un troisieme argument. 
%
% (C) Pierre Bellec 2016

% valeur par dfaut pour le pas de l'histogramm      diagddie
if nargin < 3
    epsilon = 0.01;
end

% catgories pour l'histogramme
bords = min(temps):epsilon:max(temps);

% Construit un histogramme pour les dcharges
nb_essai = max(essai);
diagd = zeros(nb_essai,length(bords));
for ee = 1:nb_essai
    diagd(ee,:) = histc(temps(essai==ee),bords);
end
diagd = diagd>0;

% On fait une figure 
imagesc(flipud(bords),1:nb_essai,diagd==0)
axis square
colormap('gray')