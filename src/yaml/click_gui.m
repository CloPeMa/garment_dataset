function xs = click_gui(im, names, xs, ax)
%CLICK_GUI Simple graphical user interface for point clicking tasks.
%
% SYNOPSIS
%   xs = click_gui(im, n)
%   xs = click_gui(im, names, xs)
%   xs = click_gui(im, names, xs, ax)
%
% INPUT
%   im      Input image.
%   n       Numer of points to be clicked.
%   names   Names of points to be clicked (Cell).
%   xs      Initial points for edit
%   ax      Axes used for display
%
% OUTPUT
%   xs      Points as column vectors.

% Libor Wagner on June 26, 2013

    % Check input
    if nargin <= 3
        fig = figure();
        ax = axes();
    end

    if isnumeric(names)
        n = names;
        names = cell(1,n);
        for i = 1:n
            names{i} = num2str(i);
        end
    else
        n = numel(names);
    end

    if nargin <= 2
        xs = nan(2,n);
    end

    % Loop over points
    stop = 0;
    i = 1;
    while (~stop)

        % Update image
        axes(ax);
        imshow(im);
        hold on;

        % User info
        info = names{i};

        % Show allready clicked points
        if ~any(any(isnan(xs)))
            plot(xs(1,:), xs(2,:), '+r', 'MarkerSize', 10)
            plot(xs(1,[1:end, 1]), xs(2,[1:end ,1]), '-r')
        else
            for k = find(~any(isnan(xs)))
                plot(xs(1,k), xs(2,k), '+r', 'MarkerSize',10)
            end
        end

        % Show current point if allready clicked
        if ~any(isnan(xs(:,i)))
            plot(xs(1,i), xs(2,i), 'oy', 'MarkerSize',15)
            info = [info ' (edit)'];
        end

        % Show some info
        title(info);

        % User input
        try
            [x,y,button] = ginput(1);
        catch
            stop = 1;
            button = 0;
        end

        % Handle input
        switch button
        case 1
            xs(:,i) = [x, y];
            i = i + 1;
            if i > n, i = 1; end
        case 110
            i = i + 1;
            if i > n, i = 1; end
        case 112
            i = i - 1;
            if i < 1, i = n; end
        case 113
            stop = 1;
        end
    end
end
