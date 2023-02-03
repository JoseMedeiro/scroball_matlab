%% Main
clear all;
close all;

%% Loading

MUSICS = load_musics('Zeee_as-a-bee.json');

%% Hour data

musicPerHour = zeros(24,1);
for c=1:length(MUSICS.track)
    h = hour(MUSICS.track(c).date);
    musicPerHour(h+1) = musicPerHour(h+1) +1;
end

%% Results

RESULTS.Artist  = retrieves_unique_artists(MUSICS.track);
RESULTS.Album   = retrieves_unique_albuns(MUSICS.track);
RESULTS.Music   = retrieves_unique_music(MUSICS.track);

%% For the plot

SETUP.title = "Number of songs per hour frame";
% Hours
figure();
polaraxes;
ax = gca;
plot_hours(ax, musicPerHour, SETUP);

%% Artist
SETUP.title = "Top 10 Artists";
f = figure();
f.Position(3:4) = [700,400];
ax = gca;
plot_stems(ax, RESULTS.Artist, SETUP);
%% Album
SETUP.title = "Top 10 Albuns";
f = figure();
f.Position(3:4) = [700,400];
ax = gca;
plot_stems(ax, RESULTS.Album, SETUP);
%% Music
SETUP.title = "Top 10 Musics";
f = figure();
f.Position(3:4) = [700,400];
ax = gca;
plot_stems(ax, RESULTS.Music, SETUP);

[url_fig, ~] = imread(MUSICS.track(1).music.image(4).x_text);
figure()
imshow(url_fig);