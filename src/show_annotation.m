function show_annotation(image, annotation)
%SHOW_ANNOTATION Show CloPeMa Garment Dataset annotation
%
% SYNOPSIS
%   annotation_show(image, annotation)
%

% Libor Wagner on August  5, 2013

    % Check fields
    if isfield(annotation,'facing')
        facing = annotation.facing;
    else
        facing = 'no facing set';
    end

    if isfield(annotation,'type')
        type = annotation.type;
    else
        type = 'no type set';
    end

    if isfield(annotation,'shape')
        shape = annotation.shape;
    else
        shape = 'no shape set';
    end

    if isfield(annotation, 'poly_c')
        poly = annotation.poly_c;
    else
        poly = [];
    end

    if isfield(annotation, 'node_names')
        node_names = annotation.node_names;
    else
        node_names = {};
    end

    % Show image on current figure and hold
    imshow(image); hold on;

    % Title will show all parameters
    title_txt = [ facing ' ' type ' ' shape];
    title(title_txt);

    % Show model polygon with names
    plot(poly(:,1), poly(:,2), '+r', 'MarkerSize', 10);
    plot(poly([1:end, 1],1), poly([1:end ,1],2), '-r');

    for k = 1:numel(node_names)
        text(poly(k,1), poly(k,2)-20, node_names{k}, 'Color', 'r',...
             'HorizontalAlignment','center',...
             'VerticalAlignment','bottom');
    end

    % Show folds
    fold_mask = cellfun(@(x)startswith(x{1},'fold'), node_names);
    fold_nums = cellfun(@(x)str2num(x{1}(6:end)), node_names(fold_mask));
    fold_idx = find(fold_mask);

    for i = 1:max(fold_nums)
        fp = poly(fold_idx(fold_nums == i),:);
        plot(fp([1:end, 1],1), fp([1:end ,1],2), '-g');
    end

end

function b = startswith(s, pat)
    sl = length(s);
    pl = length(pat);

    b = (sl >= pl && strcmp(s(1:pl), pat)) || isempty(pat);
end
