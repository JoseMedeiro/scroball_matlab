%% Plot Hours
%
%
%
%%
function plot_hours(ax, musicPerHour, SETUP)

HOURS = 24;
HourForPlot = zeros(sum(musicPerHour),1);

for c=1:HOURS
    n = 1;
    for d=1:length(musicPerHour)
        if(d==c)
            for e=1:musicPerHour(c)
                HourForPlot(n) = (d-1)/24*2*pi;
                n = n+1;
            end
        else
            HourForPlot(n) = d/24*2*pi;
            n = n+1;
        end
    end
    Transparency = musicPerHour(c)/max(musicPerHour)*0.7;
    plot(c) = polarhistogram(ax,HourForPlot(1:n-1),length(musicPerHour),...
                             'FaceColor',"#0072BD",...
                             'FaceAlpha',Transparency);
    hold on;
end
% General Settings of the plot

% Direction and Orientation
set(gca,'ThetaZeroLocation','top',...
        'ThetaDir','clockwise');
% Axis theta
angles = 0:360/24:360;
ax.ThetaTick = angles;
labels = cell(1,24);
for c=1:length(labels)
    n = c-1;
    labels{c} = num2str(n);
end
labels{1} = '24';
ax.ThetaTickLabel = labels;
% Axis r
for c=1:length(ax.RTickLabel)
    ax.RTickLabel{c} = '';
end

title(SETUP.title);
end
