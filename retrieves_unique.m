%%
%
%
%
%%
function RESULTS = retrieves_unique(musics)

artistRaw = cell(length(musics),1);
for c=1:length(musics)
    artistRaw{c} = musics(c).artist.x_text;
end

[C,~,ic]   = unique(artistRaw);
number      = accumarray(ic,1);
[~,I]       = sort(number,'descend');

for c=1:length(C)
    RESULTS(c).name  = C{I(c)};
    RESULTS(c).count = number(I(c));
end




end