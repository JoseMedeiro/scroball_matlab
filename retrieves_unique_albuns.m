%% Retrieves Album from Selection
%
%
%
%%
function RESULTS = retrieves_unique_albuns(musics)

artistRaw = cell(length(musics),1);

for c=1:length(musics)
    artistRaw{c} = musics(c).album.x_text;
end

[C,~,ic]    = unique(artistRaw);
number      = accumarray(ic,1);
[~,I]       = sort(number,'descend');

for c=1:length(C)
    RESULTS(c).name  = C{I(c)};
    RESULTS(c).count = number(I(c));
end

end