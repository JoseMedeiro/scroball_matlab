%% Loads Musics
%
% Recieves a .JSON file from the website 'https://lastfm.ghan.nl/export/' 
% with the data required.
%
%%
function MUSICS = load_musics(fileName)

data = jsondecode(fileread(fileName));

n = 1;
% While there are still pages
for c=1:size(data,1)
    % While there are still songs in pages
    for d=1:size(data(c).track,1)
        % Copies the track
        MUSICS.track(n).artist      = data(c).track(d).artist;
        MUSICS.track(n).album       = data(c).track(d).album;
        MUSICS.track(n).music.name  = data(c).track(d).name;
        MUSICS.track(n).music.mbid  = data(c).track(d).mbid;
        MUSICS.track(n).music.url   = data(c).track(d).url;
        MUSICS.track(n).music.image = data(c).track(d).image;
        MUSICS.track(n).date        = datetime(data(c).track(d).date.x_text,...
                                               'InputFormat',...
                                               'dd MMM yyyy, HH:mm');
        % Increments the step
        n = n +1;
    end
end

end