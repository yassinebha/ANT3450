function [] = dhist_direc(temps,essai,unit,pas)
% Histogramme de frequence de decharge en fonction de la direction de mouvement
% Syntaxe: [] = dhist_direc(temps,essai,unit,epsilon)
%
% temps (cell) temps{uu,dd}(pp) est le temps du pp-ime pic
%   pour l'unit uu, et la direction de mouvement pp. 
% essai (cell) essai{uu,dd}(pp) est le numro de l'essai correspondant
%   au pic. Notez que les essais sont numerotes independamment 
%   pour chaque unite et direction. 
% unit (entier, defaut 1) le numero de l'unite a utiliser pour le graphique. 
% pas (scalaire, defaut 0.1) le pas de l'histogramme.
%
% (C) Pierre Bellec, 2016. 

if nargin < 4
    pas = 0.1;
end
figure
hold on
pos = [2 3 ; 1 3; 1 2 ; 1 1; 2 1 ; 3 1 ; 3 2; 3 3];
edges = -1:pas:1;
dhist = zeros(8,length(edges));
for dd = 1:8
    dhist(dd,:) = histc(temps{unit,dd},edges)/(pas*max(essai{unit,dd}));
end
maxh = max(dhist(:));
for dd = 1:8
    subplot(3,3,(pos(dd,1)-1)*3+pos(dd,2));
    bar(edges,dhist(dd,:));
    axis([-1 1 0 1.1*maxh]);
    if pos(dd,1)==3
        xlabel('temps (s)')
    end
    if pos(dd,2)==1
        ylabel('potentiels/sec')
    end
end
