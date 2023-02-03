%% Plot Hours
%
%
%
%%
function plot_stems(ax, data,SETUP)

TOP = 10;

X = 1:1:TOP;
for c=1:TOP
    str     = [data(c).name...
               ' (' num2str(data(c).count) ')'];
    Y(c)    = data(c).count;
    Z{c}    = str;
end
stem(ax,X,Y);
axis([0.5, 10.5, 0, max(Y)*1.1]);
ax.YAxisLocation = 'right';
camroll(-90)
ax.XTickLabel = Z;

title(SETUP.title);

end
