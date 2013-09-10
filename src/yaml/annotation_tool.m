function annotation_tool(path, n)
    %ANNOTAION_TOOL for CloPeMa Garment Dataset
    %
    fig = figure('Visible','off','Position',[360,500,800,540]);
    handles = guidata(fig);
    handles.path  = path;
    handles.n = n;
    handles.type_val = 1;
    handles.shape_val = 1;

    handles.types = struct();
    handles.types(1).name = 'pants';
    handles.types(1).node_names = {'left-leg-left', 'left-leg-right', 'crotch', 'right-leg-left', 'rigth-leg-right', 'top-right','top-left'};

    handles.shapes = {'flat', 'wrinkled'};

    handles.axes = axes('Units','pixels','Position',[50,50,600,440]);
    uicontrol('Style', 'pushbutton', 'String', 'Save',...
              'Position', [660 80 130 20],...
              'Callback', @save_cb);

    handles.axes = axes('Units','pixels','Position',[50,50,600,440]);
    uicontrol('Style', 'pushbutton', 'String', 'Save & Next',...
              'Position', [660 50 130 20],...
              'Callback', @save_next_cb);

    uicontrol('Style', 'pushbutton', 'String', 'Annotate',...
              'Position', [660 110 130 20],...
              'Callback', @annotate_cb);

    uicontrol('Style', 'popup',...
              'String', handles.shapes,...
              'Position', [660 140 130 20],...
              'Callback', @shape_cb);

    uicontrol('Style', 'popup',...
              'String', {handles.types.name},...
              'Position', [660 170 130 20],...
              'Callback', @type_cb);

    guidata(fig,handles);
    load_image(fig);
    update(handles);
    set(fig,'Visible','on');

end

function annotate_cb(hObject, event)
    handles = guidata(hObject);
    handles.annotation.poly = click_gui(handles.im_c, handles.annotation.node_names,...
                                        handles.annotation.poly, handles.axes)';
    guidata(hObject, handles);
    update(handles);
end

function switch_rgb_depth_cb(hObject,event)
    handles = guidata(hObject);
    handles.show_d = ~handles.show_d;
    guidata(hObject, handles);
    update(handles);
end

function save_cb(hObject, event)
    handles = guidata(hObject);
    WriteYaml(handles.path_a,handles.annotation);
end

function save_next_cb(hObject, event)
    handles = guidata(hObject);
    WriteYaml(handles.path_a,handles.annotation);


    handles.im_d = imread(handles.path_d);
    handles.im_c = imread(handles.path_c);

    guidata(hObject, handles);
    update(handles);
end

function load_image(hObject)
handles = guidata(hObject);
handles.n = handles.n + 1;
handles.path_a = sprintf('%s/cloA%05d.yaml', handles.path, handles.n);
handles.path_d = sprintf('%s/cloD%05d.png', handles.path, handles.n);
handles.path_c = sprintf('%s/cloC%05d.png', handles.path, handles.n);

% ReadYaml(filename, nosuchfileaction, makeords)
try
    handles.annotation = ReadYaml(handles.path_a, 1, 1);
catch
    handles.annotation.path_d = sprintf('cloD%05d.png', handles.n);
    handles.annotation.path_c = sprintf('cloC%05d.png', handles.n);
    handles.annotation.type = handles.types(handles.type_val).name;
    handles.annotation.node_names = handles.types(handles.type_val).node_names;
    handles.annotation.poly = NaN(numel(handles.annotation.node_names,2));
end

guidata(hObject);
end

function type_cb(hObject, event)
    handles = guidata(hObject);
    handles.type_val = get(hObject,'Value');
    handles.annotation.type = handles.types(handles.type_val).name;
    handles.annotation.node_manes = handles.types(handles.type_val).node_names;
    guidata(hObject, handles);
    update(handles);
end

function shape_cb(hObject, event)
    handles = guidata(hObject);
    handles.shape_val = get(hObject,'Value');
    handles.annotation.shape = handles.shapes(handles.shape_val).name;
    guidata(hObject, handles);
    update(handles);
end

function update(handles)
    axes(handles.axes);
    imshow(handles.im_c)
end
