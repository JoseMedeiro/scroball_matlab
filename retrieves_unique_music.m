%% Retrieves Music from Selection
%
%
%
%%
function RESULTS = retrieves_unique_music(musics)

artistRaw = cell(length(musics),1);
imageCell = cell(length(musics),1);

for c=1:length(musics)
    artistRaw{c} = musics(c).music.name;
    imageCell{c} = musics(c).music.image(3).x_text;
end

[C,~,ic]    = unique(artistRaw);
number      = accumarray(ic,1);
[~,I]       = sort(number,'descend');

for c=1:length(C)
    RESULTS(c).name  = C{I(c)};
    RESULTS(c).count = number(I(c));
    RESULTS(c).image = imageCell{I(c)};
end