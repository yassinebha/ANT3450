function [] = ddiag_direc(temps,essai,unit,epsilon)
% Diagramme de dispersion de decharge en fonction de la direction de mouvement
% Syntaxe: [] = ddiag_direc(temps,essai,unit,epsilon)
%
% temps (cell) temps{uu,dd}(pp) est le temps du pp-ime pic
%   pour l'unit uu, et la direction de mouvement pp. 
% essai (cell) essai{uu,dd}(pp) est le numro de l'essai correspondant
%   au pic. Notez que les essais sont numerotes independamment 
%   pour chaque unite et direction. 
% unit (entier, defaut 1) le numero de l'unite a utiliser pour le graphique. 
% epsilon (scalaire, defaut 0.01) le parametre epsilon de ddiag. 
%   Tapez "help ddiag" pour plus d'informations. 
%
% (C) Pierre Bellec, 2016. 

if nargin < 4
    epsilon = 0.01;
end
figure
hold on
pos = [2 3 ; 1 3; 1 2 ; 1 1; 2 1 ; 3 1 ; 3 2; 3 3];
for dd = 1:8
    subplot(3,3,(pos(dd,1)-1)*3+pos(dd,2))
    ddiag(temps{unit,dd},essai{unit,dd},epsilon)
    if pos(dd,1)==3
        xlabel('temps (s)')
    end
    if pos(dd,2)==1
        ylabel('essai #')
    end
end