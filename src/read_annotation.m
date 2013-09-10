function annotation = read_annotation(filepath)
%READ_ANNOTATION Read CloPeMa Garment Dataset annotation.
%
% SYNOPSIS
%   annotation = read_annotation(filepath)

% Libor Wagner on August  5, 2013

    if exist(filepath, 'file')
        annotation = ReadYaml(filepath, 1, 1);
    else
        warning('File not found, returning empty structs.')
        annotation = struct();
    end

end



