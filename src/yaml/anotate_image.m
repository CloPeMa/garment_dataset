function G = anotate_image(path, k)
    %ANOTATE_IMAGE Annotation tool for CloPeMa Garment Dataset
    %
    % SYNOPSIS
    %   anotate_image(path, output)
    %
    % INPUT
    %   path    Path to the folder contatining images
    %   output  Path to output file (if the file exist the content is used to help the user)

    % Libor Wagner on July 10, 2013

    G.fig = figure('units','pixels',...
                   'position',[10 10 800 600]);



    function anotate_cb(varargin)
        G = varargin{3};
        click_gui(G.im, 5, G.fig)
    end

    function model_cb(varargin)
        disp(varargin)
    end

    function save_cb(varargin)
    end

    function update(G)
        
    end

end

